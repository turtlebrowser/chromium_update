#!/bin/bash
set -e

echo "TurtleBrowser Chromium update script, running on $OSTYPE"

# Config Options
# 0) Workfolw type (WORKFLOW)
# 1) Target platforms (TARGET_OS_LIST)
# 2) Verbose output (BUILD_VERBOSE)
# 3) Continue on error (BUILD_CONTINUE)
# 4) Qt version (QT_VERSION)
# 5) Previous tag and branch (OLD_TAG, OLD_BRANCH)
# 6) New tag and branch (NEW_TAG, NEW_BRANCH)
# 7) Root work directory (WORK_DIR)
# 8) Windows Toolchain (DEPOT_TOOLS_WIN_TOOLCHAIN ++)

# 0) Workfolw type (WORKFLOW)
# workflow selects which options are available
WORKFLOW_DEV="Dev"              # Building the current branch Qt+Chromium
WORKFLOW_ENV="Environment"      # Get the source for a prepared branch
WORKFLOW_UPD="Update"           # Get up a new branch for a new release of Chromium
WORKFLOW_PCH="Patching"         # Applying patches and fixing conflicts

WORKFLOW=$WORKFLOW_PCH

# 1) Target platforms (TARGET_OS_LIST)
# gclient target_os options:
TARGET_OS_WINDOWS="win"
TARGET_OS_LINUX="linux"
TARGET_OS_MACOS="mac"

#echo 'target_os = ["linux", "mac", "win"]' >> .gclient
TARGET_OS_LIST="$TARGET_OS_WINDOWS"

# 2) Verbose output (BUILD_VERBOSE)
BUILD_VERBOSE=true

# 3) Continue on error (BUILD_CONTINUE)
BUILD_CONTINUE=true

# 4) Qt version (QT_VERSION)
QT_VERSION="5.15.2"
QT_PACKAGE_NAME="qt-everywhere-src-${QT_VERSION}"

# 5) Previous tag and branch (OLD_TAG, OLD_BRANCH)
OLD_TAG="87.0.4280.144"
OLD_BRANCH="old/turtlebrowser_integration_chromium_87.0.4280.144_qt_5.15.2_testing_win_linux"
README_FILENAME="turtlebrowser_readme_${OLD_TAG}.txt"

# 6) New tag and branch (NEW_TAG, NEW_BRANCH)
NEW_TAG="87.0.4280.144"
NEW_BRANCH="turtlebrowser_integration_chromium_${NEW_TAG}_qt_${QT_VERSION}"
CURRENT_BRANCH=$NEW_BRANCH

# 7) Root work directory (WORK_DIR)
if [ "$OSTYPE" = "msys" ] ; then
    WORK_DIR="/c/Code"
else
    WORK_DIR="$HOME/Code"
fi

# 8) Windows Toolchain (DEPOT_TOOLS_WIN_TOOLCHAIN ++)
#export DEPOT_TOOLS_WIN_TOOLCHAIN_BASE_URL="${DEPOT_TOOLS_DIR}/win_toolchain/"
#export GYP_MSVS_HASH_a687d8e2e4114d9015eb550e1b156af21381faac="740070ef26"
export DEPOT_TOOLS_WIN_TOOLCHAIN=0
CHROMIUM_WINDOWS_SDK_VERSION="10.0.19041.0"

# Paths
CHROMIUM_UPDATE_DIR="$HOME/Code/chromium_update"
DEPOT_TOOLS_DIR="$WORK_DIR/depot_tools"
QT_DIR="$WORK_DIR/${QT_PACKAGE_NAME}"
QT_BUILD_DIR="$WORK_DIR/qt5-build"
WEB_ENGINE_DIR="$QT_DIR/qtwebengine"
THIRD_PARTY_DIR="$WEB_ENGINE_DIR/src/3rdparty/"
CHROMIUM_DIR="$THIRD_PARTY_DIR/chromium"

PATH="$PATH:${DEPOT_TOOLS_DIR}"
PATH="${CHROMIUM_DIR}/third_party/llvm-build/Release+Asserts/bin/:$PATH"

# Build flags passed to both Qt and Chromium builds
NINJAFLAGS=""
if [ "$BUILD_VERBOSE" = true ] ; then
    NINJAFLAGS="$NINJAFLAGS -v"
fi

if [ "$BUILD_CONTINUE" = true ] ; then
    NINJAFLAGS="$NINJAFLAGS -k 0"
fi

COMMON_CONFIGURE_FLAGS="-developer-build -opensource -confirm-license -nomake examples -nomake tests"

if [ "$BUILD_VERBOSE" = true ] ; then
    COMMON_CONFIGURE_FLAGS="${COMMON_CONFIGURE_FLAGS} -verbose"
else
    COMMON_CONFIGURE_FLAGS="${COMMON_CONFIGURE_FLAGS} -silent"
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

header() {
    echo -e "\e[35m$1\e[0m"
}

subheader() {
    echo -e "\e[36m$1\e[0m"
}

info() {
    echo -e "\e[34m$1\e[0m"
}

make_work_dir() {
    mkdir -p $WORK_DIR
    subheader "Work directory created : $WORK_DIR"
}

get_depot_tools() {
    cd $WORK_DIR
    if [ -d "$DEPOT_TOOLS_DIR" ]
    then
      subheader "Depot tools found at : $DEPOT_TOOLS_DIR"
    else
      git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
      subheader "Depot tools cloned at : $DEPOT_TOOLS_DIR"
    fi
}

get_qt() {
    cd $WORK_DIR
    if [ -d "$QT_DIR" ]
    then
      subheader "Qt found at : $QT_DIR"
    else
      curl -sSL https://download.qt.io/archive/qt/5.15/${QT_VERSION}/single/${QT_PACKAGE_NAME}.tar.xz | tar xJf -
      subheader "Qt extracted at : $QT_DIR"
    fi
}

get_webengine() {
    cd $QT_DIR
    mv qtwebengine old_qtwebengine
    git clone git@github.com:turtlebrowser/qtwebengine.git
    subheader "QtWebEngine cloned at : $WEB_ENGINE_DIR"
}

update_webengine() {
    cd $WEB_ENGINE_DIR
    WEB_ENGINE_BRANCH="turtlebrowser_integration_5.15"
    git checkout $WEB_ENGINE_BRANCH
    git pull
    git remote add qt https://code.qt.io/qt/qtwebengine.git
    git fetch qt
    subheader "QtWebEngine updated to : $WEB_ENGINE_BRANCH"
}

get_chromium() {
    cd $THIRD_PARTY_DIR

    if [ -d "$CHROMIUM_DIR" ]
    then
      mv chromium chromium_old
      subheader "Existing chromium moved to : $THIRD_PARTY_DIR/chromium_old"
    fi

    time git clone https://github.com/chromium/chromium.git chromium
    subheader "Chromium cloned at : $CHROMIUM_DIR"
}

checkout_current_branch() {
    cd $CHROMIUM_DIR
    git checkout -t old/${CURRENT_BRANCH}
    subheader "Checked out new branch: ${CURRENT_BRANCH}"
}

make_platform_gclient() {
    cd $THIRD_PARTY_DIR
    if [ "$OSTYPE" = "msys" ] ; then
        sed -i 's/target_os.*/target_os = ["win"]/g' ${THIRD_PARTY_DIR}/.gclient
    else
        sed -i 's/target_os.*/target_os = ["linux"]/g' ${THIRD_PARTY_DIR}/.gclient
    fi
    subheader "Modified : ${THIRD_PARTY_DIR}/.gclient"
}

run_gclient_runhooks() {
    cd $CHROMIUM_DIR
    info "Running gclient runhooks"
    gclient runhooks
    rmdir out
    subheader "Ran gclient runhooks"
}

get_upstream_chromium() {
    cd $THIRD_PARTY_DIR
    info "Run gclient config"
    gclient config --verbose --name chromium --unmanaged --custom-var checkout_nacl=False https://github.com/chromium/chromium.git
    info "Add platforms"
    echo 'target_os = ["linux", "mac", "win"]' >> .gclient
    info "Run gclient sync"
    time gclient sync --verbose || {
        info "Ignore error for missing gclient_args.gni - Need to fix DEPS to get the right path"
    }
    subheader "Chromium sync'ed at : $CHROMIUM_DIR"
}

add_remotes() {
    cd $CHROMIUM_DIR
    git remote add qt https://code.qt.io/qt/qtwebengine-chromium.git
    git remote add old git@github.com:turtlebrowser/chromium.git
    subheader "Remotes added : qt, old"
}

fetch_remotes() {
    cd $CHROMIUM_DIR
    time git -c core.deltaBaseCacheLimit=2g fetch --all --tags --verbose
    subheader "Remotes fetched : qt, old"
}

get_old_branch() {
    cd $CHROMIUM_DIR
    info "Get the old branch $OLD_BRANCH"
    time git checkout -t $OLD_BRANCH
    subheader "Chromium branch checked out: $OLD_BRANCH"
}

create_script() {
    cd $CHROMIUM_DIR
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

    subheader "Script found at: ${CHROMIUM_UPDATE_DIR}/updates/${README_FILENAME}"
}

get_new_tag() {
    cd $CHROMIUM_DIR
    git checkout tags/${NEW_TAG}
    subheader "Checked out new tag: ${NEW_TAG}"
}

create_new_branch() {
    cd $CHROMIUM_DIR
    git checkout -b $NEW_BRANCH
    subheader "Checked out new branch: ${NEW_BRANCH}"
}

fix_DEPS_file() {
    cd $CHROMIUM_DIR
    sed -i '1 i\use_relative_paths = True' DEPS
    sed -i "s+'src/+'+g" DEPS # 'src/ -> '
    sed -i 's+=src/+=+g' DEPS # =src/ -> =
    git add DEPS
    git commit -m "Fix DEPS"
    subheader "Fixed DEPS files"
}

get_chromium_deps() {
    cd $CHROMIUM_DIR
    time gclient sync --with_branch_heads --with_tags -vvv --force
    gclient runhooks
    subheader "Fetched chromium deps"
}

unignore_chromium_cipd() {
    cd $CHROMIUM_DIR
    # TODO Doesn't really work
    for cipd_dir in $(find ./ -name cipd.yaml | rev | cut -d"/" -f2- | rev | sort --unique)
    do
        echo "CIPD directory found : $cipd_dir"
        commented=true
        while [ $commented = true ]
        do
            commented=false
            commentme=$(git check-ignore --verbose "$cipd_dir" | cut -d: -f1,2 || true)
            if [ -n "$commentme" ]
            then
                file=$(echo $commentme | cut -d: -f1)
                line=$(echo $commentme | cut -d: -f2)
                info "CIPD directory needs to be un-ignored : $cipd_dir in .gitignore $file"
                sed -i "$line s/^/###/" "$file"
                commented=true
            fi
        done
    done
    subheader "Un-ignored chromium CIPD deps"
}

unignore_chromium_deps() {
    cd $CHROMIUM_DIR
    # HARDCODED cipd packages we need
    sed -i 's=^/shaka-player/dist/=###&=' third_party/.gitignore
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
    subheader "Un-ignored chromium git deps"
}

commit_dot_ignore_files() {
    cd $CHROMIUM_DIR
    git add -u .
    git commit -m "Unignore modules"
    subheader "Checked-in .gitignore files"
}

add_chromium_modules() {
    cd $CHROMIUM_DIR
    git add .
    git commit -m "Add all modules"
    subheader "Checked-in all modules"
}

add_generated_files() {
    cd $CHROMIUM_DIR
    git add --force build/config/gclient_args.gni # TODO : Not sure what makes this?
    git add --force build/util/LASTCHANGE*
    git commit -m "Add generated files"
    subheader "Checked-in all generated files"
}

push_branch_remotes() {
    cd $CHROMIUM_DIR
    git push -u old $NEW_BRANCH
    subheader "Branch pushed to remotes"
}

clean_chromium_build() {
    cd $CHROMIUM_DIR
    if [ -d "out" ]
    then
        mv out out_old
        info "Existing Chromium build moved to : ${CHROMIUM_DIR}/out_old"
    fi
    gclient runhooks
    gn gen out/Default
    cp $CHROMIUM_UPDATE_DIR/args.gn out/Default/
    subheader "CLEANED Chromium build successfully"
}

build_chromium() {
    cd $CHROMIUM_DIR
    time autoninja $NINJAFLAGS -C out/Default chrome
    subheader "Chromium built successfully"
}

clean_qt_build() {
    cd $WORK_DIR
    if [ -d "$QT_BUILD_DIR" ]
    then
        mv ${QT_BUILD_DIR} ${QT_BUILD_DIR}_old
        info "Existing Qt build moved to : ${QT_BUILD_DIR}_old"
    fi
    mkdir -p ${QT_BUILD_DIR}
    cd $QT_BUILD_DIR

    case $OSTYPE in

    "msys")
        $CHROMIUM_UPDATE_DIR/configure_qt.bat
        ;;

    "linux-gnu")
        # NINJAFLAGS have to be set before configure is run to affect Qt builds, and cannot be changed after
        export NINJAFLAGS=$NINJAFLAGS
        ../qt-everywhere-src-5.15.2/configure ${COMMON_CONFIGURE_FLAGS} -platform linux-clang-libc++
        ;;

    esac

    subheader "CLEANED Qt build successfully : $QT_BUILD_DIR"
}

build_qt() {
    cd $QT_BUILD_DIR
    if [ "$OSTYPE" = "msys" ] ; then
        $CHROMIUM_UPDATE_DIR/build_qt.bat || {
            info "Continue on error"
        }
    else
        time make -j 8
    fi
    subheader "Qt built successfully"
}

apply_patches() {
    cd $CHROMIUM_DIR
    cp ${CHROMIUM_UPDATE_DIR}/updates/${README_FILENAME} apply_patches.sh && bash apply_patches.sh
    subheader "Patches Applied"
}

case $WORKFLOW in

  $WORKFLOW_DEV)
    header "Dev Workflow"

    confirm "1.  Build both Qt and Chromium? [y/N]" && (build_qt && build_chromium)
    confirm "2.  Build Qt [y/N]" && build_qt
    confirm "3.  Build Chromium [y/N]" && build_chromium

    ;;

  $WORKFLOW_ENV)
    header "Dev Bring Up Workflow"

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
    confirm "19. Un-ignore Chromium CIPD deps? [y/N]" && unignore_chromium_cipd
    confirm "20. Push new branch to remotes (and track)? [y/N]" && push_branch_remotes
    confirm "21. Fix .gclient for current platform? [y/N]" && make_platform_gclient
    confirm "22. CLEAN Chromium build [y/N]" && clean_chromium_build
    confirm "23. Build Chromium [y/N]" && build_chromium

    ;;

  $WORKFLOW_PCH)
    header "Chromium Cherry-Pick Workflow"

    confirm "1.  Build both Qt and Chromium? [y/N]" && build_qt && build_chromium
    confirm "2.  Build Qt [y/N]" && build_qt
    confirm "3.  Build Chromium [y/N]" && build_chromium
    confirm "4.  Apply Patches? [y/N]" && apply_patches
    confirm "5.  CLEAN Qt build [y/N]" && clean_qt_build
    confirm "6.  CLEAN Chromium build [y/N]" && clean_chromium_build

    ;;
esac
