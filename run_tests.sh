#!/bin/bash
set -e

CHROMIUM_UPDATE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
WORK_DIR="/Code"
CHROMIUM_DIR="${WORK_DIR}/qt-everywhere-src-5.15.2/qtwebengine/src/3rdparty/chromium/"
BUILD_DIR="$CHROMIUM_DIR/out/Default"
DEPOT_TOOLS_DIR="${WORK_DIR}/depot_tools"
BRANCH_NAME="branchname"
PATH="$PATH:${DEPOT_TOOLS_DIR}"
# PATH="${CHROMIUM_DIR}/third_party/llvm-build/Release+Asserts/bin/:$PATH"

header() {
    echo -e "\e[33m$1\e[0m"
}

failure_header() {
    echo -e "\e[35m$1\e[0m"
}

subheader() {
    echo -e "\e[36m$1\e[0m"
}

info() {
    echo -e "\e[34m$1\e[0m"
}

build() {
    cd $CHROMIUM_DIR
    BRANCH_NAME=$(git symbolic-ref -q HEAD)
    info "[Build] Run build on ${BRANCH_NAME}"
    autoninja -C out/Default
    subheader "[Build] Finished"
}

run_unittest() {
    cd $BUILD_DIR

    local TEST_NAME=$1
    info "[Test] Running $TEST_NAME"

    local OUTPUT_FILE="${CHROMIUM_UPDATE_DIR}/tests/${TEST_NAME}.txt"
    touch $OUTPUT_FILE

    ./$TEST_NAME &> $OUTPUT_FILE || {
        failure_header "[Test] $TEST_NAME : Has Failures"
    }
    subheader "[Test] $TEST_NAME : Finished"
}

run_unittests() {

    info "[TestRun] Running unittests on branch: ${BRANCH_NAME}"

    run_unittest "accessibility_unittests"
    run_unittest "angle_unittests"
    run_unittest "app_shell_unittests"
    run_unittest "audio_unittests"
    run_unittest "aura_unittests"
    run_unittest "base_unittests"
    run_unittest "base_util_unittests"
    run_unittest "blink_common_unittests"
    run_unittest "blink_fuzzer_unittests"
    run_unittest "blink_heap_unittests"
    run_unittest "blink_platform_unittests"
    run_unittest "blink_unittests"
    run_unittest "breakpad_unittests"
    run_unittest "capture_unittests"
    run_unittest "caspian_unittests"
    run_unittest "cast_unittests"
    run_unittest "cc_unittests"
    run_unittest "ced_unittests"
    run_unittest "chrome_app_unittests"
    run_unittest "chromedriver_unittests"
    run_unittest "color_unittests"
    run_unittest "components_unittests"
    run_unittest "compositor_unittests"
    run_unittest "content_unittests"
    run_unittest "courgette_unittests"
    run_unittest "cppgc_unittests"
    run_unittest "cronet_unittests"
    run_unittest "crypto_unittests"
    run_unittest "dawn_unittests"
    run_unittest "dbus_unittests"
    run_unittest "device_unittests"
    run_unittest "display_unittests"
    run_unittest "env_chromium_unittests"
    run_unittest "events_unittests"
    run_unittest "extensions_unittests"
    run_unittest "filesystem_service_unittests"
    run_unittest "flatbuffers_unittests"
    run_unittest "font_service_unittests"
    run_unittest "gfx_unittests"
    run_unittest "gin_unittests"
    run_unittest "gl_unittests"
    run_unittest "google_apis_unittests"
    run_unittest "gpu_unittests"
    run_unittest "gwp_asan_unittests"
    run_unittest "headless_unittests"
    run_unittest "histogram_unittests"
    run_unittest "jingle_unittests"
    run_unittest "latency_unittests"
    run_unittest "libaddressinput_unittests"
    run_unittest "libjingle_xmpp_unittests"
    run_unittest "libjpeg_turbo_unittests"
    run_unittest "libphonenumber_unittests"
    run_unittest "liburlpattern_unittests"
    run_unittest "media_blink_unittests"
    run_unittest "media_learning_mojo_unittests"
    run_unittest "media_mojo_unittests"
    run_unittest "media_remoting_unittests"
    run_unittest "media_unittests"
    run_unittest "message_center_unittests"
    run_unittest "metrics_unittests"
    run_unittest "midi_unittests"
    run_unittest "mirroring_unittests"
    run_unittest "mojo_core_unittests"
    run_unittest "mojo_unittests"
    run_unittest "native_theme_unittests"
    run_unittest "net_unittests"
    run_unittest "offline_pages_unittests"
    run_unittest "one_euro_filter_unittests"
    run_unittest "openscreen_unittests"
    run_unittest "ozone_gl_unittests"
    run_unittest "ozone_unittests"
    run_unittest "ozone_x11_unittests"
    run_unittest "pdfium_unittests"
    run_unittest "pdf_unittests"
    run_unittest "perfetto_unittests"
    run_unittest "ppapi_unittests"
    run_unittest "printing_unittests"
    run_unittest "rappor_unittests"
    run_unittest "remoting_unittests"
    run_unittest "sandbox_linux_unittests"
    run_unittest "service_manager_unittests"
    run_unittest "services_unittests"
    run_unittest "shell_dialogs_unittests"
    run_unittest "skia_unittests"
    run_unittest "snapshot_unittests"
    run_unittest "sql_unittests"
    run_unittest "storage_unittests"
    run_unittest "swiftshader_system_unittests"
    run_unittest "swiftshader_unittests"
    run_unittest "tint_unittests"
    run_unittest "traffic_annotation_auditor_unittests"
    run_unittest "ui_base_unittests"
    run_unittest "ui_touch_selection_unittests"
    run_unittest "ukm_unittests"
    run_unittest "unittests"
    run_unittest "url_ipc_unittests"
    run_unittest "url_unittests"
    run_unittest "v8_cppgc_shared_unittests"
    run_unittest "variations_unittests"
    run_unittest "views_examples_unittests"
    run_unittest "views_unittests"
    run_unittest "viz_unittests"
    run_unittest "vr_common_unittests"
    run_unittest "weblayer_unittests"
    run_unittest "wm_unittests"
    run_unittest "wtf_unittests"
    run_unittest "x11_unittests"
    run_unittest "zlib_unittests"
    run_unittest "zucchini_unittests"
    run_unittest "zxcvbn_unittests"

    cd ${CHROMIUM_UPDATE_DIR}/tests
    git add .
    git commit -m "[TestRun] Results after running unittests on branch: ${BRANCH_NAME}"
}

header "Build and Run Tests"

time build
time run_unittests
