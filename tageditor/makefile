.RECIPEPREFIX +=
J = /usr/x86_64-w64-mingw32/sys-root/mingw/lib

/tmp/tageditor/tageditor: $(J)/libtagparser.a
  ./install.sh

$(J)/libtagparser.a:
  $(MAKE) -C ../tagparser

clean:
  git -C /tmp/tageditor clean -fdx
