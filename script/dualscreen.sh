#!/bin/bash

NB=`xrandr|grep " connected"|wc -l`

if [ "$NB" -eq 2 ]; then
  if [ "$1" = "--laptop" ]; then
    xrandr --output HDMI-0 --off
    #xrandr --output VGA-0 --off
  else
    #xrandr --output VGA-0 --auto --left-of LVDS
    xrandr --output HDMI-0 --auto --left-of LVDS
  fi

  if [ "$1" = "off" ]; then
    xrandr --output LVDS --off
  fi
else
  xrandr --auto
fi
