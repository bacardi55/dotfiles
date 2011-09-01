#!/bin/sh
urxvtd -q -f -o & 

wicd-gtk &
volumeicon &
keepassx & 
parcellite &
cherrytree &
sh ~/.fehbg &
mocp -S &
trayfreq &
ptbatterysystemtray &
twmnd &

sh ~/.config/wmfs/status.sh &

exec ck-launch-session wmfs
