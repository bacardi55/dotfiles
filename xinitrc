#!/bin/sh
urxvtd -q -f -o & 

wicd-gtk &
volumeicon &
keepassx & 
parcellite &

exec ck-launch-session wmfs
