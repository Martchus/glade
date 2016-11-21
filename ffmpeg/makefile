.RECIPEPREFIX +=
J = /usr/x86_64-w64-mingw32/sys-root/mingw/lib

/tmp/ffmpeg/ffmpeg: $(J)/libfdk-aac.a $(J)/libx264.a
  ./install.sh

$(J)/libfdk-aac.a:
  $(MAKE) -C ../fdk-aac

$(J)/libx264.a:
  $(MAKE) -C ../x264
