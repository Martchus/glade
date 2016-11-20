#!/bin/dash -e
git clone --depth 1 git://github.com/mstorsjo/fdk-aac /tmp/fdk-aac
cd /tmp/fdk-aac
./autogen.sh
./configure --host=x86_64-w64-mingw32 \
--prefix=/usr/x86_64-w64-mingw32/sys-root/mingw
make install
