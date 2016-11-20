#!/bin/dash -e
host=x86_64-w64-mingw32
prefix=/usr/$host/sys-root/mingw
cc=$host-gcc
ar=$host-ar

# mbedtls
wget tls.mbed.org/download/mbedtls-1.3.10-gpl.tgz
tar xf mbedtls-1.3.10-gpl.tgz
cd mbedtls-1.3.10
make lib AR=$ar CC=$cc
make install DESTDIR=$prefix
cd ..

# polar
git clone git://github.com/cesanta/polar

# mongoose
git clone --depth 1 git://github.com/cesanta/mongoose
cd mongoose/examples/web_server
make polarssl CFLAGS_EXTRA='-s -lws2_32 -liphlpapi' CC=$cc POLARSSL_PATH=$prefix
upx -9 web_server.exe
cp certs/cert.pem .
cat > mongoose.bat <<+
@echo off
start web_server -listening_port ssl://2:cert.pem
start https://127.0.0.1:2
+
vr=$(./web_server - 2>&1 | awk 'NR==1 {print $3}')
# this is smaller than ‘-9’
zip mongoose-ssl-"$vr".zip web_server.exe cert.pem mongoose.bat
