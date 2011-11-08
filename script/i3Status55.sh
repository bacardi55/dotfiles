#!/bin/bash

i3status | while :
do
  task=`i3Task.sh`
  read line
  echo "$task | $line"
done
