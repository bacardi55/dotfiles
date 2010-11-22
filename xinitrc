#!/bin/sh
urxvtd -q -f -o & 

xscreensaver -no-splash &

exec ck-launch-session /usr/local/bin/wmfs
#exec ck-launch-session gnome-session
