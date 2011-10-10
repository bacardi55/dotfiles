#!/bin/bash

bat_percent=$((`cat /sys/class/power_supply/BAT*/energy_now`/`cat /sys/class/power_supply/BAT*/energy_full_design | sed 's/00$//'`))
bat_acpi=`cat /sys/class/power_supply/BAT*/status`
if [ "$bat_percent" -lt "8" -a "$bat_acpi" != "Charging" ]; then
	pm-suspend
fi
