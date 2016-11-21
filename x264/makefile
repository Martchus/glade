.RECIPEPREFIX +=
J = /usr/x86_64-w64-mingw32/sys-root/mingw/lib

$(J)/libx264.a: /bin/x86_64-w64-mingw32-gcc /bin/yasm /bin/git
  ./install.sh

/bin/x86_64-w64-mingw32-gcc:
  sage install mingw64-x86_64-gcc-core

/bin/yasm:
  sage install yasm

/bin/git:
  sage install --nodeps git
