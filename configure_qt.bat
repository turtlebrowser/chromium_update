CALL "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x64 10.0.19041.0
SET _ROOT=C:\Code\qt-everywhere-src-5.15.2
SET PATH=%_ROOT%\qtbase\bin;%_ROOT%\gnuwin32\bin;%PATH%
SET _ROOT=
CALL ..\qt-everywhere-src-5.15.2\configure.bat -developer-build -opensource -confirm-license -nomake examples -nomake tests -platform win32-clang-msvc
