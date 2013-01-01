#!/bin/sh
urxvtd -q -f -o &

#wicd-gtk &
volumeicon &
#keepassx &
#parcellite &
#cherrytree &
sh ~/.fehbg &
#mocp -S &
#trayfreq &
#ptbatterysystemtray &
unclutter -grab &
#twmnd &

xset +fp /usr/share/fonts/local
xset fp rehash

#sh ~/.config/wmfs/status.sh &
#exec ck-launch-session gnome
exec ck-launch-session i3
#exec ck-launch-session wmfs
