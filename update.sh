#!/bin/bash
set -e

echo "TurtleBrowser Chromium update script, running on: $OSTYPE"
CHROMIUM_UPDATE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

header() {
    if [ "$OSTYPE" = "darwin19" ] ; then
      echo -e "$1"
    else
      echo -e "\e[35m$1\e[0m"
    fi
}

subheader() {
    if [ "$OSTYPE" = "darwin19" ] ; then
      echo -e "$1"
    else
      echo -e "\e[36m$1\e[0m"
    fi
}

info() {
    if [ "$OSTYPE" = "darwin19" ] ; then
      echo -e "$1"
    else
      echo -e "\e[34m$1\e[0m"
    fi
}

show_help() {
    header "General Options"
    info "-j <num> number of compile jobs (Default 8)"
    info "-v verbose output from tools invoked (Default off)"
    info "-k compilation should continue on error (Default off)"
    info "-w work directory (Default '/c/Code' (win) or '/Code' (linux))"
    info "-x external, does not require rights (Default off)"
    info "-s skip actual build steps (Default off)"
    info "-r only build release (Default off)"
    info "-t build tests (Default off)"

    header "Workflow Options - only one of the below at a time"
    info "-d Developer      Workflow: (Default) Building the current branch Qt+Chromium"
    info "-e Environment    Workflow: Setting up the development environment for a dev using the current branch"
    info "-u Update         Workflow: Updating to a new Chromium version and set up a branch"
    info "-p Patching       Workflow: Applying the patches to an update branch"
    info "-q Qt build       Workflow: Just build Qt (Assumes setup has been done)"
    info "-c Chromium build Workflow: Just build Chromium (Assumes setup has been done)"
}

# 5) Qt version (QT_VERSION)
# 6) Previous tag and branch (OLD_TAG, OLD_BRANCH)
# 7) New tag and branch (NEW_TAG, NEW_BRANCH)
# 8) Windows Toolchain (DEPOT_TOOLS_WIN_TOOLCHAIN ++)

# 0) Compile jobs
BUILD_JOBS=8

# dupeqc) Workfolw type (WORKFLOW)
# workflow selects which options are available
WORKFLOW_DEV="Dev"              # -d (Default)
WORKFLOW_ENV="Environment"      # -e
WORKFLOW_UPD="Update"           # -u
WORKFLOW_PCH="Patching"         # -p
WORKFLOW_QT="BuildQt"           # -q
WORKFLOW_CHR="BuildChromium"    # -c

WORKFLOW=$WORKFLOW_DEV

# v) Verbose output (BUILD_VERBOSE)
BUILD_VERBOSE=false

# k) Continue on error (BUILD_CONTINUE)
BUILD_CONTINUE=false

# x) Build uses https instead of ssh
BUILD_EXTERNAL=false

# s) Skip all building steps
BUILD_SKIP=false

# r) Build release only
BUILD_RELEASE=false

# t) Build tests
BUILD_TESTS=false

# 4) Root work directory (WORK_DIR)
if [ "$OSTYPE" = "msys" ] ; then
    WORK_DIR="/c/Code"
elif [ "$OSTYPE" = "darwin19" ] ; then
    WORK_DIR="$HOME/Work"
else
    WORK_DIR="/Code"
fi

# Process commandline 
OPTIND=1

while getopts "h?vkxsrtj:w:dupeqc" opt; do
    case "$opt" in
    h|\?)
        show_help
        exit 0
        ;;
    d)  WORKFLOW=$WORKFLOW_DEV
        ;;
    u)  WORKFLOW=$WORKFLOW_UPD
        ;;
    p)  WORKFLOW=$WORKFLOW_PCH
        ;;
    e)  WORKFLOW=$WORKFLOW_ENV
        ;;
    q)  WORKFLOW=$WORKFLOW_QT
        ;;
    c)  WORKFLOW=$WORKFLOW_CHR
        ;;
    v)  BUILD_VERBOSE=true
        ;;
    k)  BUILD_CONTINUE=true
        ;;
    x)  BUILD_EXTERNAL=true
        ;;
    r)  BUILD_RELEASE=true
        ;;
    t)  BUILD_TESTS=true
        ;;
    s)  BUILD_SKIP=true
        ;;
    j)  BUILD_JOBS=$OPTARG
        ;;
    w)  WORK_DIR=$OPTARG
        ;;
    esac
done

shift $((OPTIND-1))

[ "${1:-}" = "--" ] && shift

info "Verbose:    $BUILD_VERBOSE"
info "Continue:   $BUILD_CONTINUE"
info "Skip build: $BUILD_SKIP"
info "External:   $BUILD_EXTERNAL"
info "Release:    $BUILD_RELEASE"
info "With tests: $BUILD_TESTS"
info "Jobs:       $BUILD_JOBS"
info "Workflow:   $WORKFLOW"
info "Work dir:   $WORK_DIR"
echo "Leftovers:  $@"

# 5) Qt version (QT_VERSION)
QT_VERSION="5.15.2"
QT_PACKAGE_NAME="qt-everywhere-src-${QT_VERSION}"

# 6) Previous tag and branch (OLD_TAG, OLD_BRANCH)
OLD_TAG="88.0.4324.182"

# 7) New tag and branch (NEW_TAG, NEW_BRANCH)
NEW_TAG="89.0.4389.72"
NEW_BRANCH="turtlebrowser_integration_chromium_${NEW_TAG}_qt_${QT_VERSION}_testing"
CURRENT_BRANCH=$NEW_BRANCH

if [ "$BUILD_EXTERNAL" = true ] ; then
  BRANCH_REMOTE="origin"
  CHROMIUM_ORIGIN_URL="--depth 1 https://github.com/turtlebrowser/chromium.git --branch $CURRENT_BRANCH --single-branch"
  QT_WEBENGINE_ORIGIN_URL="https://github.com/turtlebrowser/qtwebengine.git"
else
  BRANCH_REMOTE="old"
  CHROMIUM_ORIGIN_URL="https://github.com/chromium/chromium.git"
  QT_WEBENGINE_ORIGIN_URL="git@github.com:turtlebrowser/qtwebengine.git"
fi

OLD_BRANCH="$BRANCH_REMOTE/turtlebrowser_integration_chromium_${OLD_TAG}_qt_${QT_VERSION}_prep_for_89"
README_FILENAME="turtlebrowser_readme_${OLD_TAG}.txt"

# 8) Windows Toolchain (DEPOT_TOOLS_WIN_TOOLCHAIN ++)
#export DEPOT_TOOLS_WIN_TOOLCHAIN_BASE_URL="${DEPOT_TOOLS_DIR}/win_toolchain/"
#export GYP_MSVS_HASH_a687d8e2e4114d9015eb550e1b156af21381faac="740070ef26"
export DEPOT_TOOLS_WIN_TOOLCHAIN=0
CHROMIUM_WINDOWS_SDK_VERSION="10.0.19041.0"

# Paths
DEPOT_TOOLS_DIR="$WORK_DIR/depot_tools"
QT_DIR="$WORK_DIR/${QT_PACKAGE_NAME}"
QT_BUILD_DIR="$WORK_DIR/qt5-build"
WEB_ENGINE_DIR="$QT_DIR/qtwebengine"
THIRD_PARTY_DIR="$WEB_ENGINE_DIR/src/3rdparty/"
CHROMIUM_DIR="$THIRD_PARTY_DIR/chromium"

PATH="$PATH:${DEPOT_TOOLS_DIR}"

# Not using the Chromium Clang on MacOS yet
if [ "$OSTYPE" != "darwin19" ] ; then
PATH="${CHROMIUM_DIR}/third_party/llvm-build/Release+Asserts/bin/:$PATH"
fi

# Build flags passed to both Qt and Chromium builds
NINJAFLAGS="-j $BUILD_JOBS"
if [ "$BUILD_VERBOSE" = true ] ; then
    NINJAFLAGS="$NINJAFLAGS -v"
fi

CONTINUE_FLAG=""
if [ "$BUILD_CONTINUE" = true ] ; then
    NINJAFLAGS="$NINJAFLAGS -k 0"
    CONTINUE_FLAG="-k"
fi

# NINJAFLAGS have to be set before configure is run to affect Qt builds, and cannot be changed after
export NINJAFLAGS=${NINJAFLAGS}
export NINJAJOBS=${NINJAFLAGS}

# https://github.com/qt/qtbase/blob/5.15.2/config_help.txt
COMMON_CONFIGURE_FLAGS="-opensource -confirm-license -nomake examples"

if [ "$BUILD_TESTS" = false ] ; then
    COMMON_CONFIGURE_FLAGS="${COMMON_CONFIGURE_FLAGS} -nomake tests"
fi

if [ "$BUILD_VERBOSE" = true ] ; then
    COMMON_CONFIGURE_FLAGS="${COMMON_CONFIGURE_FLAGS} -verbose"
else
    COMMON_CONFIGURE_FLAGS="${COMMON_CONFIGURE_FLAGS} -silent"
fi

if [ "$BUILD_RELEASE" = true ] ; then
    COMMON_CONFIGURE_FLAGS="${COMMON_CONFIGURE_FLAGS} -release"
else
    COMMON_CONFIGURE_FLAGS="${COMMON_CONFIGURE_FLAGS} -developer-build"
fi

confirm() {
    read -r -p "${1:-Are you sure? [y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}

make_work_dir() {
    info "[Init] Make work directory"
    mkdir -p $WORK_DIR
    subheader "[Init] Work directory created : $WORK_DIR"
}

get_depot_tools() {
    cd $WORK_DIR
    info "[Depot tools] Retrieve"
    if [ -d "$DEPOT_TOOLS_DIR" ]
    then
      subheader "[Depot tools] Checkout found at : $DEPOT_TOOLS_DIR"
    else
      git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
      subheader "[Depot tools] Cloned at : $DEPOT_TOOLS_DIR"
    fi
}

get_qt() {
    cd $WORK_DIR
    info "[Qt] Retrieve"
    if [ -d "$QT_DIR" ]
    then
      subheader "[Qt] Directory found at : $QT_DIR"
    else
      time curl -O -sSL https://download.qt.io/archive/qt/5.15/${QT_VERSION}/single/${QT_PACKAGE_NAME}.tar.xz
      time tar xf ${QT_PACKAGE_NAME}.tar.xz
      rm ${QT_PACKAGE_NAME}.tar.xz
      info "[Qt] Deleting ${QT_DIR}/qtwebengine"
      rm -rf ${QT_DIR}/qtwebengine
      subheader "[Qt] Directory extracted at : $QT_DIR"
    fi
}

get_webengine() {
    cd $QT_DIR
    info "[QtWebEngine] Retrieve"
    if [ -d "$WEB_ENGINE_DIR" ]
    then
      subheader "[QtWebEngine] Checkout found at : $WEB_ENGINE_DIR"
    else
      git clone $QT_WEBENGINE_ORIGIN_URL
      subheader "[QtWebEngine] Cloned at : $WEB_ENGINE_DIR"
    fi
}

update_webengine() {
    cd $WEB_ENGINE_DIR
    info "[QtWebEngine] Update"
    WEB_ENGINE_BRANCH="turtlebrowser_integration_5.15"

    BRANCH="$(git rev-parse --abbrev-ref HEAD)"
    if [[ "$BRANCH" != "$WEB_ENGINE_BRANCH" ]]; then
      git checkout $WEB_ENGINE_BRANCH
      git remote add qt https://code.qt.io/qt/qtwebengine.git
      git fetch qt
      subheader "[QtWebEngine] Checked out current branch : ${WEB_ENGINE_BRANCH}"
    else
      git pull --ff-only
      subheader "[QtWebEngine] Current branch updated : ${WEB_ENGINE_BRANCH}"
    fi
}

get_chromium() {
    cd $THIRD_PARTY_DIR
    info "[Chromium] Retrieve"
    if [ -d "$CHROMIUM_DIR" ]
    then
      subheader "[Chromium] Checkout found at : $CHROMIUM_DIR"
    else
      time git clone $CHROMIUM_ORIGIN_URL chromium
      subheader "[Chromium] Cloned at : $CHROMIUM_DIR"
    fi
}

checkout_current_branch() {
    cd $CHROMIUM_DIR
    info "[Chromium] Update"
    BRANCH="$(git rev-parse --abbrev-ref HEAD)"
    if [[ "$BRANCH" != "$CURRENT_BRANCH" ]]; then
      git checkout -t ${BRANCH_REMOTE}/${CURRENT_BRANCH}
      git update-index --assume-unchanged build/util/LASTCHANGE
      git update-index --assume-unchanged build/util/LASTCHANGE.committime
      subheader "[Chromium] Checked out current branch: ${CURRENT_BRANCH}"
    else
      git pull --ff-only
      subheader "[Chromium] Current branch updated : ${CURRENT_BRANCH}"
    fi
}

make_platform_gclient() {
    cd $THIRD_PARTY_DIR
    info "[Chromium] Configure for this platform"
    if [ "$OSTYPE" = "msys" ] ; then
        sed -i 's/target_os.*/target_os = ["win"]/g' ${THIRD_PARTY_DIR}/.gclient
    elif [ "$OSTYPE" = "darwin19" ] ; then
        sed -i 's/target_os.*/target_os = ["mac"]/g' ${THIRD_PARTY_DIR}/.gclient
    else
        sed -i 's/target_os.*/target_os = ["linux"]/g' ${THIRD_PARTY_DIR}/.gclient
    fi
    subheader "[Chromium] Modified : ${THIRD_PARTY_DIR}/.gclient"
}

run_gclient_runhooks() {
    cd $CHROMIUM_DIR
    info "[Chromium] Run gclient runhooks"
    gclient runhooks
    rmdir out
    subheader "[Chromium] Ran gclient runhooks"
}

get_upstream_chromium() {
    cd $THIRD_PARTY_DIR
    info "[Chromium] Run gclient config"
    gclient config --verbose --name chromium --unmanaged --custom-var checkout_nacl=False https://github.com/chromium/chromium.git
    info "[Chromium] Add platforms"
    if [ "$OSTYPE" = "msys" ] ; then
        echo 'target_os = ["linux", "win"]' >> .gclient
    else
        echo 'target_os = ["linux", "mac", "win"]' >> .gclient
    fi
    info "[Chromium] Run gclient sync"
    time gclient sync --verbose || {
        info "[Chromium] Ignore error for missing gclient_args.gni - Need to fix DEPS to get the right path"
    }
    subheader "[Chromium] sync'ed at : $CHROMIUM_DIR"
}

add_remotes() {
    cd $CHROMIUM_DIR
    info "[Chromium] Add remotes"

    if [ "$BUILD_EXTERNAL" = true ] ; then
      subheader "[Chromium] Skipping adding remotes"
      return
    fi

    subheader "[Chromium] Checking remote old"
    info "[Chromium] Add remote old : git@github.com:turtlebrowser/chromium.git"
    git remote add old git@github.com:turtlebrowser/chromium.git

    subheader "[Chromium] Checking remote qt"
    info "[Chromium] Add remote qt : https://code.qt.io/qt/qtwebengine-chromium.git"
    git remote add qt https://code.qt.io/qt/qtwebengine-chromium.git

    subheader "[Chromium] Remotes added : qt, old"
}

fetch_remotes() {
    cd $CHROMIUM_DIR
    info "[Chromium] Fetch remotes"

    if [ "$BUILD_EXTERNAL" = true ] ; then
      subheader "[Chromium] Skipping fetching remotes"
      return
    fi

    time git -c core.deltaBaseCacheLimit=2g fetch --all --tags --verbose
    subheader "[Chromium] Remotes fetched : qt, old"
}

get_old_branch() {
    cd $CHROMIUM_DIR
    info "[Chromium] Get the old branch $OLD_BRANCH"
    time git checkout -t $OLD_BRANCH
    subheader "[Chromium] branch checked out: $OLD_BRANCH"
}

create_script() {
    cd $CHROMIUM_DIR
    info "[Chromium] Create patch script"
    # Get the tags
    OLD_TAG_SHA=`git log -1 --format=format:"%H" ${OLD_TAG}`
    HEAD_SHA=`git log -1 --format=format:"%H" HEAD`

    # Get all the commits
    git log --ancestry-path ${OLD_TAG_SHA}..${HEAD_SHA} --pretty=format:"git cherry-pick --strategy=recursive -X patience %h%x09 # %ae%x09%ad%x09%s" > commit_log.txt
    echo -e '\n' >> commit_log.txt
    tac commit_log.txt > cherry_pick_log.txt

    # Create the readme script
    echo -e '#!/bin/bash' > $README_FILENAME
    echo -e 'set -e\n' >> $README_FILENAME
    echo -e "# Based on branch: ${OLD_BRANCH}" >> $README_FILENAME
    cat cherry_pick_log.txt >> $README_FILENAME

    rm commit_log.txt cherry_pick_log.txt
    mv $README_FILENAME ${CHROMIUM_UPDATE_DIR}/updates/${README_FILENAME}

    subheader "[Chromium] Script found at: ${CHROMIUM_UPDATE_DIR}/updates/${README_FILENAME}"
}

get_new_tag() {
    cd $CHROMIUM_DIR
    info "[Chromium] Check out new tag"
    git checkout tags/${NEW_TAG}
    subheader "[Chromium] Checked out new tag: ${NEW_TAG}"
}

create_new_branch() {
    cd $CHROMIUM_DIR
    info "[Chromium] Check out new branch"
    git checkout -b $NEW_BRANCH
    subheader "[Chromium] Checked out new branch: ${NEW_BRANCH}"
}

fix_DEPS_file() {
    cd $CHROMIUM_DIR
    info "[Chromium] Fix DEPS file before update"
    sed -i '1 i\use_relative_paths = True' DEPS
    sed -i "s+'src/+'+g" DEPS # 'src/ -> '
    sed -i 's+=src/+=+g' DEPS # =src/ -> =
    git add DEPS
    git commit -m "Fix DEPS"
    subheader "[Chromium] Fixed DEPS files"
}

get_chromium_deps() {
    cd $CHROMIUM_DIR
    info "[Chromium] Get dependencies"
    time gclient sync --with_branch_heads --with_tags -vvv --force
    gclient runhooks
    subheader "[Chromium] Fetched chromium deps"
}

unignore_chromium_cipd() {
    cd $CHROMIUM_DIR
    info "[Chromium] Un-ignore CIPD modules"
    # TODO Doesn't really work
    for cipd_dir in $(find ./ -name cipd.yaml | rev | cut -d"/" -f2- | rev | sort --unique)
    do
        echo "[Chromium] CIPD directory found : $cipd_dir"
        commented=true
        while [ $commented = true ]
        do
            commented=false
            commentme=$(git check-ignore --verbose "$cipd_dir" | cut -d: -f1,2 || true)
            if [ -n "$commentme" ]
            then
                file=$(echo $commentme | cut -d: -f1)
                line=$(echo $commentme | cut -d: -f2)
                info "[Chromium] CIPD directory needs to be un-ignored : $cipd_dir in .gitignore $file"
                sed -i "$line s/^/###/" "$file"
                commented=true
            fi
        done
    done
    subheader "[Chromium] Un-ignored CIPD deps"
}

unignore_chromium_deps() {
    cd $CHROMIUM_DIR
    info "[Chromium] Un-ignore Git modules"
    # HARDCODED cipd packages we need
    sed -i 's=^/shaka-player/dist/=###&=' third_party/.gitignore
    # HARDCODED .gitignores
    sed -i 's=^/build.\*=###&=' ./third_party/ffmpeg/.gitignore

    for gitdir in $(find . -type d -name .git | grep -v "^./.git$" | sort --unique)
    do
        commented=true
        while [ $commented = true ]
        do
            commented=false
            commentme=$(git check-ignore --verbose "$gitdir" | cut -d: -f1,2 || true)
            if [ -n "$commentme" ]
            then
                file=$(echo $commentme | cut -d: -f1)
                line=$(echo $commentme | cut -d: -f2)
                sed -i "$line s/^/###/" "$file"
                commented=true
            fi
        done

        echo rm -rf "$gitdir"
        rm -rf "$gitdir"
    done
    subheader "[Chromium] Un-ignored chromium git deps"
}

commit_dot_ignore_files() {
    cd $CHROMIUM_DIR
    info "[Chromium] Commit .gitignore files"
    git add -u .
    git commit -m "Unignore modules"
    subheader "[Chromium] Checked-in .gitignore files"
}

add_chromium_modules() {
    cd $CHROMIUM_DIR
    info "[Chromium] Check in all modules"
    git add .
    git commit -m "Add all modules"
    subheader "[Chromium] Checked-in all modules"
}

add_generated_files() {
    cd $CHROMIUM_DIR
    info "[Chromium] Add required generated files"
    git add --force build/config/gclient_args.gni # TODO : Not sure what makes this?
    git add --force build/util/LASTCHANGE*
    git commit -m "Add generated files"
    git update-index --assume-unchanged build/util/LASTCHANGE
    git update-index --assume-unchanged build/util/LASTCHANGE.committime
    subheader "[Chromium] Checked-in all generated files"
}

push_branch_remotes() {
    cd $CHROMIUM_DIR
    info "[Chromium] Push new branch"
    git push -u old $NEW_BRANCH
    subheader "[Chromium] Branch pushed to remotes"
}

clean_chromium_build() {
    cd $CHROMIUM_DIR
    info "[Chromium] Prepare clean build"
    if [ -d "out" ]
    then
        mv out out_old
        info "[Chromium] Existing build moved to : ${CHROMIUM_DIR}/out_old"
    fi
    gclient runhooks
    gn gen out/Default --args='use_jumbo_build=true symbol_level=0 is_debug=false'
    subheader "[Chromium] CLEANED build successfully"
}

build_chromium() {
    cd $CHROMIUM_DIR
    info "[Chromium] Build"

    if [ "$BUILD_SKIP" = true ] ; then
      subheader "[Chromium] Skipping build"
      return
    fi

    time autoninja $NINJAFLAGS -C out/Default chrome || {
        info "[Chromium] Continue on error"
    }
    subheader "[Chromium] built successfully"
}

clean_qt_build() {
    cd $WORK_DIR
    info "[Qt] Prepare clean build"
    if [ -d "$QT_BUILD_DIR" ]
    then
        mv ${QT_BUILD_DIR} ${QT_BUILD_DIR}_old
        info "[Qt] Existing build moved to : ${QT_BUILD_DIR}_old"
    fi
    mkdir -p ${QT_BUILD_DIR}
    cd $QT_BUILD_DIR

    case $OSTYPE in

    "msys")
        $CHROMIUM_UPDATE_DIR/configure_qt.bat "${QT_DIR}" "${NINJAFLAGS}" "${CHROMIUM_WINDOWS_SDK_VERSION}" "${COMMON_CONFIGURE_FLAGS}"
        ;;

    "linux-gnu")
        ../qt-everywhere-src-5.15.2/configure ${COMMON_CONFIGURE_FLAGS} -platform linux-clang-libc++
        ;;

    "darwin19")
        ../qt-everywhere-src-5.15.2/configure ${COMMON_CONFIGURE_FLAGS} -platform macx-clang
        ;;

    esac

    subheader "[Qt] CLEANED build successfully : $QT_BUILD_DIR"
}

build_qt() {
    cd $QT_BUILD_DIR
    info "[Qt] Build"

    if [ "$BUILD_SKIP" = true ] ; then
      subheader "[Qt] Skipping build"
      return
    fi

    if [ "$OSTYPE" = "msys" ] ; then
        time $CHROMIUM_UPDATE_DIR/build_qt.bat "${QT_DIR}" "${NINJAFLAGS}" "${CHROMIUM_WINDOWS_SDK_VERSION}" $BUILD_JOBS "$CONTINUE_FLAG" || {
            info "[Qt] Continue on error"
        }
        # https://bugreports.qt.io/browse/QTBUG-36463
        mkdir -p qtbase/include/QtAngle/
        cp -r ${QT_DIR}/qtbase/src/3rdparty/angle/include/* qtbase/include/QtAngle/
    else
        time make $CONTINUE_FLAG -j $BUILD_JOBS || {
            info "[Qt] Continue on error"
        }
    fi
    subheader "[Qt] built successfully"
}

apply_patches() {
    cd $CHROMIUM_DIR
    info "[Chromium] Apply Patches"
    cp ${CHROMIUM_UPDATE_DIR}/updates/${README_FILENAME} apply_patches.sh && bash apply_patches.sh
    subheader "[Chromium] Patches Applied"
}

case $WORKFLOW in

  $WORKFLOW_QT)
    header "Build Qt Workflow"

    confirm "1.  Build Qt [y/N]" && build_qt

    ;;

  $WORKFLOW_CHR)
    header "Build Chromium Workflow"

    confirm "1.  Build Chromium [y/N]" && build_chromium

    ;;

  $WORKFLOW_DEV)
    header "Dev Workflow"

    confirm "1.  Build both Qt and Chromium? [y/N]" && (build_qt && build_chromium)
    confirm "2.  Build Qt [y/N]" && build_qt
    confirm "3.  Build Chromium [y/N]" && build_chromium

    ;;

  $WORKFLOW_ENV)
    header "Dev Environment Bring Up Workflow"

    confirm "1.  Make work directory? [y/N]" && make_work_dir
    confirm "2.  Get Depot Tools? [y/N]" && get_depot_tools
    confirm "3.  Get Qt? [y/N]" && get_qt
    confirm "4.  Get QtWebEngine? [y/N]" && get_webengine
    confirm "5.  Checkout the QtWebEngine branch? [y/N]" && update_webengine
    confirm "6.  Get TurtleBrowser Chromium? [y/N]" && get_chromium
    confirm "7.  Add remotes? [y/N]" && add_remotes
    confirm "8.  Fetch remotes? [y/N]" && fetch_remotes
    confirm "9.  Checkout current branch? [y/N]" && checkout_current_branch
    confirm "10. Fix .gclient for current platform? [y/N]" && make_platform_gclient
    confirm "11. Run gclient runhooks? [y/N]" && run_gclient_runhooks
    confirm "12. CLEAN Qt build? [y/N]" && clean_qt_build
    confirm "13. CLEAN Chromium build? [y/N]" && clean_chromium_build
    confirm "14. Build both Chromium and Qt? [y/N]" && build_chromium && build_qt

    ;;

  $WORKFLOW_UPD)
    header "Chromium Update Workflow"

    confirm "1.  Make work directory? [y/N]" && make_work_dir
    confirm "2.  Get Depot Tools? [y/N]" && get_depot_tools
    confirm "3.  Get Qt? [y/N]" && get_qt
    confirm "4.  Get QtWebEngine? [y/N]" && get_webengine
    confirm "5.  Checkout the QtWebEngine branch? [y/N]" && update_webengine
    confirm "6.  Get Upstream Chromium? [y/N]" && get_upstream_chromium
    confirm "7.  Add remotes? [y/N]" && add_remotes
    confirm "8.  Fetch remotes? [y/N]" && fetch_remotes
    confirm "9.  Get the old branch? [y/N]" && get_old_branch
    confirm "10. Create cherry pick script [y/N]" && create_script
    confirm "11. Checkout new tag [y/N]" && get_new_tag
    confirm "12. Checkout new branch [y/N]" && create_new_branch
    confirm "13. Fix DEPS file [y/N]" && fix_DEPS_file
    confirm "14. Get Chromium deps [y/N]" && get_chromium_deps
    confirm "15. Check-in all generated files? [y/N]" && add_generated_files
    confirm "16. Un-ignore Chromium Git deps? [y/N]" && unignore_chromium_deps
    confirm "17. Check-in .gitignore files? [y/N]" && commit_dot_ignore_files
    confirm "18. Check-in Chromium Git deps? [y/N]" && add_chromium_modules
#    confirm "19. Un-ignore Chromium CIPD deps? [y/N]" && unignore_chromium_cipd
    confirm "20. Push new branch to remotes (and track)? [y/N]" && push_branch_remotes
    confirm "21. Fix .gclient for current platform? [y/N]" && make_platform_gclient
    confirm "22. Run gclient runhooks? [y/N]" && run_gclient_runhooks
    confirm "23. CLEAN Qt build? [y/N]" && clean_qt_build
    confirm "24. CLEAN Chromium? build [y/N]" && clean_chromium_build
    confirm "25. Build Chromium? [y/N]" && build_chromium

    ;;

  $WORKFLOW_PCH)
    header "Chromium Cherry-Pick Workflow"

    confirm "1.  Apply Patches? [y/N]" && apply_patches
    confirm "2.  Fix .gclient for current platform? [y/N]" && make_platform_gclient
    confirm "3.  Run gclient runhooks? [y/N]" && run_gclient_runhooks
    confirm "4.  CLEAN Qt build? [y/N]" && clean_qt_build
    confirm "5.  CLEAN Chromium build? [y/N]" && clean_chromium_build
    confirm "6.  Build both Qt and Chromium? [y/N]" && build_qt && build_chromium
    confirm "7.  Build Qt [y/N]" && build_qt
    confirm "8.  Build Chromium [y/N]" && build_chromium

    ;;
esac
