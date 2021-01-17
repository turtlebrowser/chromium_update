# chromium_update

Get clang 11
```
sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
sudo apt install libc++-dev libc++abi-dev
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-11 100
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-11 100
```

```
cd ~
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
wget https://download.qt.io/archive/qt/5.15/5.15.2/single/qt-everywhere-src-5.15.2.tar.xz
tar xf qt-everywhere-src-5.15.2.tar.xz
cd qt-everywhere-src-5.15.2
rm -rf qtwebengine
git clone --depth 1 git@github.com:turtlebrowser/qtwebengine.git
cd qtwebengine/src/3rdparty
git clone --depth 1 git@github.com:turtlebrowser/chromium.git
cd chromium/
export PATH="$PATH:${HOME}/depot_tools"
gclient runhooks
cd ~
mkdir qt5-build
cd qt5-build
export NINJAFLAGS="-v -k 0"
../qt-everywhere-src-5.15.2/configure -platform linux-clang-libc++ -developer-build -opensource -confirm-license -nomake examples -nomake tests
make -j 8
```
