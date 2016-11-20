#!/bin/sh -e
# FIXME
# 1. FFmpeg
# 2. static
# 3. CMAKE_C_COMPILER environment?

# c++utilities
git clone git://github.com/Martchus/cpp-utilities
cd cpp-utilities
cmake -DCMAKE_C_COMPILER=x86_64-w64-mingw32-gcc \
-DCMAKE_CXX_COMPILER=x86_64-w64-mingw32-g++ \
-DCMAKE_RC_COMPILER_INIT=x86_64-w64-mingw32-windres \
-DCMAKE_FIND_ROOT_PATH=/usr/x86_64-w64-mingw32/sys-root/mingw \
-DCMAKE_INSTALL_PREFIX=/usr/x86_64-w64-mingw32/sys-root/mingw &&
echo PASS || echo FAIL
make install && echo PASS || echo FAIL
cd ..

# tagparser
git clone git://github.com/Martchus/tagparser
cd tagparser
cmake -DCMAKE_C_COMPILER=x86_64-w64-mingw32-gcc \
-DCMAKE_CXX_COMPILER=x86_64-w64-mingw32-g++ \
-DCMAKE_RC_COMPILER_INIT=x86_64-w64-mingw32-windres \
-DCMAKE_FIND_ROOT_PATH=/usr/x86_64-w64-mingw32/sys-root/mingw \
-DCMAKE_INSTALL_PREFIX=/usr/x86_64-w64-mingw32/sys-root/mingw &&
echo PASS || echo FAIL
make install && echo PASS || echo FAIL
cd ..

# tageditor
git clone git://github.com/Martchus/tageditor
cd tageditor
PATH=..:$PATH
cmake -DCMAKE_C_COMPILER=x86_64-w64-mingw32-gcc \
-DCMAKE_CXX_COMPILER=x86_64-w64-mingw32-g++ \
-DCMAKE_RC_COMPILER_INIT=x86_64-w64-mingw32-windres \
-DCMAKE_FIND_ROOT_PATH=/usr/x86_64-w64-mingw32/sys-root/mingw \
-DWIDGETS_GUI=OFF && echo PASS || echo FAIL
make && echo PASS || echo FAIL
