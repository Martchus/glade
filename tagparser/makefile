.RECIPEPREFIX +=
J = /usr/x86_64-w64-mingw32/sys-root/mingw/lib

$(J)/libtagparser.a: $(J)/libz.a /bin/cmake /bin/x86_64-w64-mingw32-g++ /bin/git
  ./install.sh

$(J)/libz.a:
  sage install mingw64-x86_64-zlib

/bin/cmake:
  sage install cmake

/bin/x86_64-w64-mingw32-g++:
  sage install mingw64-x86_64-gcc-g++

/bin/git:
  sage install --nodeps git
