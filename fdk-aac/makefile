.RECIPEPREFIX +=
J = /usr/x86_64-w64-mingw32/sys-root/mingw/lib

$(J)/libfdk-aac.a: /bin/autoreconf /bin/libtool \
/bin/x86_64-w64-mingw32-g++ /bin/git
  ./install.sh

/bin/autoreconf:
  sage install automake

/bin/libtool:
  sage install libtool

/bin/x86_64-w64-mingw32-g++:
  sage install mingw64-x86_64-gcc-g++

/bin/git:
  sage install --nodeps git
