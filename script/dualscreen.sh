#!/bin/bash

NB=`xrandr|grep " connected"|wc -l`

if [ "$NB" -eq 2 ]; then
  xrandr --output VGA-0 --auto --left-of LVDS
else
  xrandr --auto
fi
