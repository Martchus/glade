.RECIPEPREFIX +=
J = /usr/x86_64-w64-mingw32/sys-root/mingw/lib

$(J)/libc++utilities.a: $(J)/libiconv.a /bin/cmake \
/bin/x86_64-w64-mingw32-g++ /bin/git
  ./install.sh

/bin/git:
  sage install --nodeps git

/bin/cmake:
  sage install cmake

/bin/x86_64-w64-mingw32-g++:
  sage install mingw64-x86_64-gcc-g++

$(J)/libiconv.a:
  sage install mingw64-x86_64-win-iconv
