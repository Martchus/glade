.RECIPEPREFIX +=

/tmp/x264/libx264.a: /bin/x86_64-w64-mingw32-gcc /bin/yasm /bin/git
  ./make.sh

/bin/x86_64-w64-mingw32-gcc:
  sage install mingw64-x86_64-gcc-core

/bin/yasm:
  sage install yasm

/bin/git:
  sage install --nodeps git
