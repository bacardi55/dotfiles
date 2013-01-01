#!/usr/bin/env zsh
#
# Works best with blinking text; the last heart will blink
# when you have less than 25% of your battery life remaining.

FULL="$(cat /sys/class/power_supply/BAT1/energy_full)"
NOW="$(cat /sys/class/power_supply/BAT1/energy_now)"
BATTERY=$(echo "scale=25;$NOW/$FULL" | bc)

if [[ $BATTERY -lt .25 ]]; then
  echo "\e[5;31m♥\e[0;31m♡♡\e[0m"
elif [[ $BATTERY -lt .50 ]]; then
  echo "\e[31m♥♡♡\e[0m"
elif [[ $BATTERY -lt .75 ]]; then
  echo "\e[31m♥♥♡\e[0m"
else
  echo "\e[31m♥♥♥\e[0m"
fi
