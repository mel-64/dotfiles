#!/usr/bin/env bash

BAT="/sys/class/power_supply/BAT0"

[ -f "$BAT/model_name" ] || exit 0

cap=$(cat "$BAT/capacity")

if [ "$cap" -ge 90 ]; then icon=" "
elif [ "$cap" -ge 70 ]; then icon=" "
elif [ "$cap" -ge 50 ]; then icon=" "
elif [ "$cap" -ge 10 ]; then icon=" "
else icon=" "
fi

if grep -q Charging "$BAT/status" 2>/dev/null; then
    charge="󱐋"
else
    charge=""
fi

echo "$cap% <span>$icon$charge</span>"
