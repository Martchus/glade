.RECIPEPREFIX +=
J = /usr/x86_64-w64-mingw32/sys-root/mingw/lib

$(J)/libtagparser.a: $(J)/libc++utilities.a $(J)/libz.a
  ./install.sh

$(J)/libc++utilities.a:
  $(MAKE) -C ../cpp-utilities

$(J)/libz.a:
  sage install mingw64-x86_64-zlib
