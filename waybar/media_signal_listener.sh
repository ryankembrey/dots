#!/bin/bash

playerctl metadata --follow | while read -r; do
    pkill -SIGRTMIN+10 waybar
done
