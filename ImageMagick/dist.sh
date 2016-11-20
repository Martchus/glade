#!/bin/dash -e
cd /tmp
# FIXME cygwin.com/ml/cygwin/2016-10/msg00298.html
ec=$(lynx -dump -listonly -nonumbers imagemagick.org/download/binaries |
awk '/x64.zip$/ {fo = $0} END {print fo}')
wget -nc "$ec"
unzip -n "$(basename "$ec")" convert.exe
chmod +x convert.exe
touch magic.xml
go=$(./convert -version | awk '{print $3; exit}')
zip imageMagick-"$go".zip convert.exe magic.xml
