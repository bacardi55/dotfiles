#!/bin/bash

NB=`xrandr|grep " connected"|wc -l`

if [ "$NB" -eq 2 ]; then
  xrandr --output VGA-0 --auto --left-of LVDS
  if [ "$1" = "off" ]; then
    xrandr --output LVDS --off
  fi
else
  xrandr --auto
fi
