#!/bin/bash

# Get brightness value
lux=`cat /sys/class/backlight/acpi_video0/brightness`

case "$1" in
  up)
    if [ "$lux" -lt 7 ];then
      new=$((lux + 1))
      echo "$new" 
    else
      echo "already 7"
    fi;
  ;;
  down)
    if [ "$lux" -gt 0 ];then
      new=$((lux - 1))
      echo "new $new" 
    else
      echo "already 0"
    fi;
  ;;
  *)
    echo "usage: $0 {up|down}"
  ;;
esac
exit 0
