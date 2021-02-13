SET QT_DIRECTORY=%1
SET NINJAFLAGS=%~2
SET NINJAJOBS=%~2
SET CHROMIUM_WINDOWS_SDK_VERSION=%3
SET COMMON_CONFIGURE_FLAGS=%~4
CALL "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvarsall.bat" x64 %CHROMIUM_WINDOWS_SDK_VERSION%
CALL "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x64 %CHROMIUM_WINDOWS_SDK_VERSION%
SET PATH=%QT_DIRECTORY%\qtbase\bin;%QT_DIRECTORY%\gnuwin32\bin;%QT_DIRECTORY%\qtwebengine\src\3rdparty\chromium\third_party\llvm-build\Release+Asserts\bin;%PATH%
CALL ..\qt-everywhere-src-5.15.2\configure.bat %COMMON_CONFIGURE_FLAGS% -platform win32-clang-msvc
