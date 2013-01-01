#!/bin/sh

DATA=`gksudo cat /sys/class/backlight/acpi_video0/brightness`
echo "$DATA"

if [ "$1" == "+" -a "$DATA" -lt "7" ];
then
  NEW=$(($DATA + 1))
elif [ "$1" == "-" -a "$DATA" -gt 0 ];
then
  NEW=$(($DATA - 1))
fi;

echo "old: $DATA - new: $NEW"


#echo $1 > /sys/class/backlight/acpi_video0/brightness
