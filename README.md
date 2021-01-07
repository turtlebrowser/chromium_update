# chromium_update

```
cd ~
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
wget https://download.qt.io/archive/qt/5.15/5.15.2/single/qt-everywhere-src-5.15.2.tar.xz
tar xf qt-everywhere-src-5.15.2.tar.xz
cd qt-everywhere-src-5.15.2
rm -rf qtwebengine
git clone git@github.com:turtlebrowser/qtwebengine.git
cd qtwebengine/src/3rdparty
git clone --depth=1 git@github.com:turtlebrowser/chromium.git
cd chromium/
export PATH="$PATH:${HOME}/depot_tools"
gclient runhooks
cd ~
mkdir qt5-build
cd qt5-build
../qt-everywhere-src-5.15.2/configure -platform linux-clang -developer-build -opensource -confirm-license -nomake examples -nomake tests
export NINJAFLAGS="-v -k 0"
make -j 8
```
