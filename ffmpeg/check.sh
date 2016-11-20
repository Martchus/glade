#!/bin/dash -e

# x264 fdk-aac
/tmp/ffmpeg/ffmpeg -y -hide_banner -ss 00:27:00 \
-i '/home/videos/breaking bad/season 3/breaking bad s3e12 half measures.mp4' \
-t 10 outfile.mp4
