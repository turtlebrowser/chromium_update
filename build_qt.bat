SET QT_DIRECTORY=%1
SET NINJAFLAGS=%~2
SET NINJAJOBS=%~2
SET CHROMIUM_WINDOWS_SDK_VERSION=%3
SET BUILD_JOBS=%4
SET CONTINUE_FLAG=%~5
CALL "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvarsall.bat" x64 %CHROMIUM_WINDOWS_SDK_VERSION%
CALL "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x64 %CHROMIUM_WINDOWS_SDK_VERSION%
SET PATH=%QT_DIRECTORY%\qtbase\bin;%QT_DIRECTORY%\gnuwin32\bin;%QT_DIRECTORY%\qtwebengine\src\3rdparty\chromium\third_party\llvm-build\Release+Asserts\bin;%PATH%
SET DEPOT_TOOLS_WIN_TOOLCHAIN=0 
CALL jom %CONTINUE_FLAG% -j %BUILD_JOBS%
