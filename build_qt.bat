SET QT_DIRECTORY=C:\Code\qt-everywhere-src-5.15.2
SET CHROMIUM_WINDOWS_SDK_VERSION=10.0.19041.0
CALL "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x64 %CHROMIUM_WINDOWS_SDK_VERSION%
SET PATH=%QT_DIRECTORY%\qtbase\bin;%QT_DIRECTORY%\gnuwin32\bin;%QT_DIRECTORY%\qtwebengine\src\3rdparty\chromium\third_party\llvm-build\Release+Asserts\bin;%PATH%
SET DEPOT_TOOLS_WIN_TOOLCHAIN=0 
CALL jom -k -j 12
