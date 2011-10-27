#!/bin/bash

NB=`xrandr|grep " connected"|wc -l`

if [ "$NB" -eq 2 ]; then
  xrandr --output DVI-I-1 --auto --left-of VGA-1
else
  xrandr --auto
fi
