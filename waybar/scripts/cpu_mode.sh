#!/bin/bash

mode=$(cpupower frequency-info | grep "The governor" | awk '{print $3}')
mode=$(echo "$mode" | tr -d '"')

if [ "$mode" == "powersave" ]; then
    # Prompt for sudo password using zenity
    password=$(zenity --password --title="Enter sudo password" --timeout=10)
    if [ $? -eq 0 ]; then
        echo "$password" | sudo -S cpupower frequency-set -g performance
        echo "$password" | sudo -S bash -c 'echo "0" > /sys/devices/system/cpu/intel_pstate/no_turbo'
        notify-send "CPU Mode" "Set to performance"
    else
        zenity --error --text="Password prompt timed out or canceled."
        exit 1
    fi
else
    password=$(zenity --password --title="Enter sudo password" --timeout=10)
    if [ $? -eq 0 ]; then
        echo "$password" | sudo -S cpupower frequency-set -g powersave
        echo "$password" | sudo -S bash -c 'echo "1" > /sys/devices/system/cpu/intel_pstate/no_turbo'
        notify-send "CPU Mode" "Set to powersave"
    else
        zenity --error --text="Password prompt timed out or canceled."
        exit 1
    fi
fi
