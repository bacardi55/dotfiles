#!/bin/bash

bat_percent=$((`cat /sys/class/power_supply/BAT*/energy_now`/`cat /sys/class/power_supply/BAT*/energy_full_design | sed 's/00$//'`))
bat_acpi=`cat /sys/class/power_supply/BAT*/status`
if [ "$bat_percent" -lt "15" -a "$bat_acpi" != "Charging" ]; then
  twmnc --pos top_right -t "Battery Level" -c "The battery level is too LOW ($bat_percent %)" --bg red --fg black --aot --fs 20
fi
