#!/bin/bash

CONFIG="work"

if [ "$1" != "" ];then
  CONFIG="$1"
fi;

cd .i3/i3WebManager-0.3/ && php console i3CliManager:start "$CONFIG"
