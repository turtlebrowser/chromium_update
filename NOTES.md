# Notes

## Find the next tag to base an update on

Find the tag: https://chromereleases.googleblog.com/search/label/Stable%20updates

Pick the newest desktop tag for the version you want to update to.

## Cherry picking from qtwebengine-chromium

If you need new patches from Qt - for a Qt release
```bash
git cherry-pick -Xsubtree=chromium --strategy=recursive -X patience SHA
```

## Which files are in a commit?
```bash
git show --name-only --format="" SHA
```

## Using a zip file for Windows SDK

As we go a zip would maybe make more sense and take less room, but not sure how that would be combined with Qt and TurtleBrowser.
https://chromium.googlesource.com/chromium/src/+/HEAD/docs/win_cross.md

## Modules that don't get added when doing the update on windows (Chromium 87)

```bash
        third_party/cros_system_api/
        third_party/fontconfig/src/
        third_party/google_toolbox_for_mac/src/
        third_party/libdrm/src/
        third_party/libipp/libipp/
        third_party/liblouis/src/
        third_party/libsync/src/
        third_party/lss/
        third_party/minigbm/src/
        third_party/minizip/src/
        third_party/perfetto/ui/src/gen
        third_party/pyelftools/
        third_party/wayland-protocols/src/
        third_party/wayland/src/
        third_party/wds/src/
        third_party/weston/src/
        third_party/xdg-utils/
```

## Getting Clang

Qt is currently built with the clang that comes with Chromium, so these notes on getting Clang are not important at this time.

### Linux, Get clang 11

#### Add in clang-11

```bash
sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
sudo apt install libc++-dev libc++abi-dev
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-11 100
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-11 100
```

#### Set compiler to clang-11

```bash
sudo update-alternatives --set clang /usr/bin/clang-11
sudo update-alternatives --set clang++ /usr/bin/clang++-11
```

### Windows, Get clang 11

#### Get Scoop

```powershell
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
```

#### Install LLVM (includes Clang)

```bash
scoop install llvm
clang --version
```

## Extra Linux dependency?

```bash
export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig/
sudo apt install xcb-proto
sudo apt install python-xcbgen
```
