#!/bin/sh -x

entries="󱆃 Bash\n Sway\n󱟛 Waybar_Config\n󱟛 Waybar_Style\n NeoVim\n Foot"

selected=$(echo -e $entries|wofi --width 250 --height 210 --prompt "Configs: " --dmenu --insensitive --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  zsh)
    exec foot -e nvim ~/.bashrc;;
  sway)
    exec foot -e nvim ~/.config/sway/config;;
  waybar_config)
    exec foot -e nvim ~/.config/waybar/config;;
  waybar_style)
    exec foot -e nvim ~/.config/waybar/style.css;;
  foot)
    exec foot -e nvim ~/.config/foot/foot.ini;;
  neovim)
    exec foot -e nvim ~/.config/nvim/init.vim;;
esac
