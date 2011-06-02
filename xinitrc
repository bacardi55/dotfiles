#!/bin/sh

urxvtd -q -f -o & 

wicd-gtk &
volumeicon &
keepassx & 
parcellite &
cherrytree &
trayfreq &

exec ck-launch-session wmfs
