#!/bin/dash -e

# x264 fdk-aac
/tmp/ffmpeg/ffmpeg -y -hide_banner -ss 27:00 \
-i '/tv/breaking bad/season 3/breaking bad s3e12 half measures.mp4' \
-t 10 -c:a libfdk_aac outfile.mp4
