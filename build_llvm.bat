CALL "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x64
set LLVM_ROOT=C:/Code/qt-everywhere-src-5.15.2/qtwebengine/src/3rdparty/chromium/third_party/llvm-build/Release+Asserts/bin
set LLVM_INSTALL=C:/Code/llvm_install
cmake -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="%LLVM_INSTALL%" -DLLVM_OPTIMIZED_TABLEGEN=On -DLLVM_ENABLE_PDB=ON -DLLVM_ENABLE_LLD=True -DLLVM_ENABLE_PROJECTS='chrometools;llvm;clang;clang-tools-extra;lld;lldb;compiler-rt;libcxx;libcxxabi;libunwind' -DLIBCXXABI_USE_LLVM_UNWINDER=ON -DLIBCXX_CXX_ABI=default -DCMAKE_C_COMPILER="%LLVM_ROOT%/clang-cl.exe" -DCMAKE_CXX_COMPILER="%LLVM_ROOT%/clang-cl.exe" -DCMAKE_LINKER="%LLVM_ROOT%/lld-link.exe" -DLLVM_USE_CRT_RELEASE=MT ..\llvm
cmake --build . --config Release --target install
