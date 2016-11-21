#!/bin/dash -e
[ -d /tmp/tagparser ] ||
git clone git://github.com/Martchus/tagparser /tmp/tagparser
cd /tmp/tagparser
cmake -DCMAKE_AR=/bin/x86_64-w64-mingw32-ar \
-DCMAKE_C_COMPILER=x86_64-w64-mingw32-gcc \
-DCMAKE_CXX_COMPILER=x86_64-w64-mingw32-g++ \
-DCMAKE_RC_COMPILER_INIT=x86_64-w64-mingw32-windres \
-DCMAKE_FIND_ROOT_PATH=/usr/x86_64-w64-mingw32/sys-root/mingw \
-DCMAKE_INSTALL_PREFIX=/usr/x86_64-w64-mingw32/sys-root/mingw \
-DDISABLE_SHARED_LIBS=1 -DENABLE_STATIC_LIBS=1
make --jobs=4 install
