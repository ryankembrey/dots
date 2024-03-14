#!/bin/bash

# Get the connected WiFi network name using nmcli
connected_network=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d ':' -f 2)

network_name="Unknown"

case "$connected_network" in
    "EXETEL 8BC9B0 2.4G")
        network_name="Home 2.4G "
        ;;
    "EXETEL 8BC9B0 5G")
        network_name="Home 5G "
        ;;
    "Galaxy S20 FE9E60")
        network_name="Phone "
        ;;
    "UTS-WiFi")
        network_name="UTS WiFi "
        ;;
    "Kvarnakersvagen")
        network_name="Kvarnakersvagen "
        ;;
    "#Telia-CAD788")
        network_name="#Telia-CAD788 "
        ;;
esac

# Print JSON formatted output
echo "{\"text\": \"$network_name\"}"
