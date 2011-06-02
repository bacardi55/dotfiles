#!/bin/sh
urxvtd -q -f -o & 

wicd-gtk &
volumeicon &
keepassx & 
parcellite &
cherrytree &
trayfreq &

source /etc/X11/xinit/xinitrc.d/30-dbussource /etc/X11/xinit/xinitrc.d/30-dbus

exec ck-launch-session wmfs
