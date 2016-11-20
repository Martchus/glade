#!/bin/dash
new() {
  mkdir -p "$pn/$1"
  cd "$pn/$1"
}
pn=$(mktemp -d -p "$PWD")
new

# /
echo 'start bin/bash -l' > cygwin.bat
date=$(date)
cygwin_version=$(uname -r | cut -d '(' -f 1)
sed 's/$/\r/' > readme.txt <<+
Baby Cygwin by Steven Penny

Steven’s Home Page: http://github.com/svnpenn

Today’s date $date

The build script for this build can be found at
  http://github.com/svnpenn/a

Included with this package
  Cygwin $cygwin_version

OPERATING INSTRUCTIONS
  Put any scripts into /usr/local/bin
  Double click cygwin.bat
+

# /tmp
new tmp

# /dev
new dev

# /etc
new etc
cat > profile <<'+'
PATH=/usr/bin:/usr/local/bin:$PATH
PS1='\033];\a\n\033[33m\w\n\033[m$ '
[ -e ~ ] || mkdir -p ~
[ -e ~/.bash_history ] || echo cd > ~/.bash_history
[ -e /bin/awk ] || ln -s /bin/gawk /bin/awk
[ -e /dev/fd ] || ln -s /proc/self/fd /dev/fd
cd
+

# /usr/bin
j=$(mktemp)
printf '/bin/%s\n' bash cat chmod cp cut date dirname du dumper expr file find \
gawk grep ln ls mkdir mkpasswd mount mv printf ps rm rmdir sed sh sleep sort \
stat tee tr uname uniq wget xargs > $j
new bin
xargs cp -t . < $j
xargs ldd < $j | awk '/usr/ && ! br[$0]++ {print $3}' | xargs cp -t .

# /usr/local/bin
new usr/local/bin

# /usr/share/terminfo
new usr/share
cp -r /usr/share/terminfo .

# archive
baby_version=1.0.1
new
zip -r baby-cygwin-$baby_version.zip *
