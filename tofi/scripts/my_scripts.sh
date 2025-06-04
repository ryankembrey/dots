#!/bin/sh -x

entries=" Configs\n Power_Menu\n Bookmarks\n Scripts\n0 Assignments"

selected=$(echo -e $entries|tofi --prompt "Edit Script: " | awk '{print tolower($2)}')

case $selected in
  configs)
    exec foot -e nvim ~/.config/wofi/scripts/configs.sh;;
  power_menu)
    exec foot -e nvim ~/.config/wofi/scripts/wofi_power.sh;;
  bookmarks)
    exec foot -e nvim ~/.config/wofi/scripts/bookmarks.sh;;
  scripts)
    exec foot -e nvim ~/.config/wofi/scripts/my_scripts.sh;;
  assignments)
    exec foot -e nvim ~/.config/wofi/scripts/quick_assignments.sh;;
esac
