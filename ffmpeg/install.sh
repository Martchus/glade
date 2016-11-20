#!/bin/dash -e
git clone --depth 1 git://source.ffmpeg.org/ffmpeg /tmp/ffmpeg
cd /tmp/ffmpeg
./configure --disable-doc --enable-gpl --enable-nonfree --enable-libfdk-aac \
--enable-libx264 --arch=x86_64 --target-os=mingw32 --extra-ldflags=-static \
--logfile=/dev/stdout --cross-prefix=x86_64-w64-mingw32-
make
