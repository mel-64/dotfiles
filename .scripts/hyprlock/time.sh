#!/bin/bash

export LC_TIME=en_US.UTF-8

current_hour=$(date +%H)

if [ "$current_hour" -lt 5 ]; then
    time_of_day="night"
elif [ "$current_hour" -lt 12 ]; then
    time_of_day="morning"
elif [ "$current_hour" -lt 17 ]; then
    time_of_day="afternoon"
elif [ "$current_hour" -lt 22 ]; then
    time_of_day="evening"
else
    time_of_day="night"
fi

current_time=$(date +"%H:%M")
day_of_week=$(date +"%A")

echo "It's $current_time on a $day_of_week $time_of_day."
