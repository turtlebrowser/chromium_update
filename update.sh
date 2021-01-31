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
OLD_BRANCH="old/turtlebrowser_integration_chromium_87.0.4280.144_qt_5.15.2_testing3"
README_FILENAME="turtlebrowser_readme_${OLD_TAG}.txt"

# 6) New tag and branch (NEW_TAG, NEW_BRANCH)
NEW_TAG="87.0.4280.144"
NEW_BRANCH="turtlebrowser_integration_chromium_${NEW_TAG}_qt_${QT_VERSION}_testing_win"

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

# Paths
CHROMIUM_UPDATE_DIR="$HOME/Code/chromium_update"
DEPOT_TOOLS_DIR="$WORK_DIR/depot_tools"
QT_DIR="$WORK_DIR/${QT_PACKAGE_NAME}"
QT_BUILD_DIR="$WORK_DIR/qt5-build"
WEB_ENGINE_DIR="$QT_DIR/qtwebengine"
THIRD_PARTY_DIR="$WEB_ENGINE_DIR/src/3rdparty/"
CHROMIUM_DIR="$THIRD_PARTY_DIR/chromium"

PATH="$PATH:${DEPOT_TOOLS_DIR}"

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

    git clone https://github.com/chromium/chromium.git chromium
    subheader "Chromium cloned at : $CHROMIUM_DIR"
}

get_upstream_chromium() {
    cd $THIRD_PARTY_DIR
    gclient config --verbose --name chromium --unmanaged --custom-var checkout_nacl=False https://github.com/chromium/chromium.git
    echo 'target_os = ["win"]' >> .gclient
    gclient sync || {
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
    git -c core.deltaBaseCacheLimit=2g fetch --all --tags --verbose
    subheader "Remotes fetched : qt, old"
}

get_old_branch() {
    cd $CHROMIUM_DIR
    info "Get the old branch $OLD_BRANCH"
    git checkout -t $OLD_BRANCH
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

    subheader "Script found at: $CHROMIUM_DIR/$README_FILENAME"
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
    gclient sync --with_branch_heads --with_tags -vvv
    gclient runhooks
    subheader "Fetched chromium deps"
}

unignore_chromium_deps() {
    cd $CHROMIUM_DIR
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
    subheader "Un-ignored chromium deps"
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

push_branch_remotes() {
    cd $CHROMIUM_DIR
    git push -u old $NEW_BRANCH
    git push gitea $NEW_BRANCH
    subheader "Branch pushed to remotes"
}

clean_chromium_build() {
    if [ "$BUILD_CLEAN" = true ] ; then
        cd $CHROMIUM_DIR
        gclient runhooks
        mv out out_old
        info "Existing Chromium build moved to : ${CHROMIUM_DIR}/out_old"
        gn gen out/Default
        cp $CHROMIUM_UPDATE_DIR/args.gn out/Default/
        subheader "CLEANED Chromium build successfully"
    else
        subheader "SKIPPED cleaning of Chromium build"
    fi
}

build_chromium() {
    cd $CHROMIUM_DIR
    time autoninja $NINJAFLAGS -C out/Default chrome
    subheader "Chromium built successfully"
}

clean_qt_build() {
    if [ "$BUILD_CLEAN" = true ] ; then
        cd $WORK_DIR
        if [ -d "$QT_BUILD_DIR" ]
        then
            mv ${QT_BUILD_DIR} ${QT_BUILD_DIR}_old
            info "Existing Qt build moved to : ${QT_BUILD_DIR}_old"
        fi
        mkdir -p ${QT_BUILD_DIR}
        cd $QT_BUILD_DIR
        ../qt-everywhere-src-5.15.2/configure -platform linux-clang-libc++ -developer-build -opensource -confirm-license -nomake examples -nomake tests
        subheader "CLEANED Qt build successfully : $QT_BUILD_DIR"
    else
        subheader "SKIPPED cleaning of Qt build : $QT_BUILD_DIR"
    fi
}

build_qt() {
    cd $QT_BUILD_DIR
    time make -j 8
    subheader "Qt built successfully"
}

header "Update Chromium"

confirm "0.  Build both Qt and Chromium? [y/N]" && build_qt && build_chromium
confirm "1.  Make work directory? [y/N]" && make_work_dir
confirm "2.  Get Depot Tools? [y/N]" && get_depot_tools
confirm "3.  Get Qt? [y/N]" && get_qt
confirm "4.  Get QtWebEngine? [y/N]" && get_webengine
confirm "5.  Checkout the QtWebEngine branch? [y/N]" && update_webengine
confirm "6.  Get Chromium? [y/N]" && get_chromium
confirm "7.  Add remotes? [y/N]" && add_remotes
confirm "8.  Fetch remotes? [y/N]" && fetch_remotes
confirm "9.  Get the old branch? [y/N]" && get_old_branch
confirm "10. Create cherry pick script [y/N]" && create_script
confirm "11. Checkout new tag [y/N]" && get_new_tag
confirm "12. Checkout new branch [y/N]" && create_new_branch
confirm "13. Fix DEPS file [y/N]" && fix_DEPS_file
confirm "14. Get Chromium deps [y/N]" && get_chromium_deps
confirm "15. Un-ignore Chromium deps [y/N]" && unignore_chromium_deps
confirm "16. Check-in .gitignore files [y/N]" && commit_dot_ignore_files
confirm "17. Check-in Chromium modules [y/N]" && add_chromium_modules
confirm "18. Push new branch to remotes (and track) [y/N]" && push_branch_remotes
confirm "19. CLEAN Chromium build [y/N]" && clean_chromium_build
confirm "20. Build Chromium [y/N]" && build_chromium
confirm "21. CLEAN Qt build [y/N]" && clean_qt_build
confirm "22. Build Qt [y/N]" && build_qt
