#! /bin/sh

set -e

autoconf
autoheader
echo timestamp > stamp-h.in
for rmk in conf/*.rmk ${GRUB_CONTRIB}/*/conf/*.rmk; do
  if test -e $rmk ; then
    ruby genmk.rb < $rmk > `echo $rmk | sed 's/\.rmk$/.mk/'`
  fi
done
./gendistlist.sh > DISTLIST

exit 0
