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

redshift -l 48.8566667:2.3509871 &

#sh ~/.config/wmfs/status.sh &
#exec ck-launch-session gnome
exec ck-launch-session dbus-launch i3
#exec ck-launch-session wmfs
