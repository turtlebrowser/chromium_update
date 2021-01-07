# chromium_update

```
cd ~
tar xf qt-everywhere-src-5.15.2.tar.xz
cd qt-everywhere-src-5.15.2
rm -rf qtwebengine
git clone git@github.com:turtlebrowser/qtwebengine.git
cd qtwebengine/src/3rdparty
git clone --depth=1 git@github.com:turtlebrowser/chromium.git
cd ~
mkdir qt5-build
cd qt5-build
../qt-everywhere-src-5.15.2/configure -developer-build -opensource -nomake examples -nomake tests
export NINJAFLAGS="-v -k 0"
make -j 8
```
