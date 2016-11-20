#!/bin/dash -e
git clone --depth 1 git://git.videolan.org/x264 /tmp/x264
cd /tmp/x264
./configure --enable-static --prefix=/usr/x86_64-w64-mingw32/sys-root/mingw \
--cross-prefix=x86_64-w64-mingw32-
make install
