.RECIPEPREFIX +=

/tmp/ffmpeg/ffmpeg: fdk-aac x264 diffutils
  ./make.sh

fdk-aac:
  $(MAKE) -C ../fdk-aac

x264:
  $(MAKE) -C ../x264

diffutils:
  sage install diffutils
