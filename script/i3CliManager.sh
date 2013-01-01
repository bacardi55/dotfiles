#!/bin/bash

CONFIG="work"

if [ "$1" != "" ];then
  CONFIG="$1"
fi;

echo "RUNNING: cd .i3/i3WebManager-0.3/ && php console i3CliManager:start $CONFIG"
#cd .i3/i3WebManager-0.3/ && php console i3CliManager:start "$CONFIG"
