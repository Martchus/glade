#!/bin/dash -e
# need full clone for autoreconf
git clone --single-branch git://github.com/stedolan/jq
cd jq
git pull origin pull/939/head
autoreconf --install
./configure --host x86_64-w64-mingw32
make --jobs 4 LDFLAGS='-s -lshlwapi'
upx -9 jq.exe
vr=$(./jq --version | sed :)
zip -9 "$vr".zip jq.exe
