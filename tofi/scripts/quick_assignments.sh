#!/bin/sh -x

entries="Discovery_Report\nMaterials_Ass_1\nRobot_Code\nPortfolio\nPixy_Cam"

selected=$(echo -e $entries|wofi --width 250 --height 210 --prompt "Assignment: " --dmenu --insensitive --cache-file /dev/null | awk '{print tolower($1)}')

case $selected in
  portfolio)
    cd ~/university/2023/autumn/mechanical_design_studio/portfolio
    alacritty -e nvim portfolio_24464265.tex & zathura portfolio_24464265.pdf & disown;;
  discovery_report)
    cd ~/university/2023/spring/design_innovation/discovery_report    
    alacritty -e nvim discovery_report.tex & zathura discovery_report.pdf & disown;;
  materials_ass_1)
    cd ~/university/2023/spring/materials/assignment1
    alacritty -e nvim assignment1.tex & zathura assignment1.pdf;;
  pixy_cam)
    cd ~/Arduino/pixy_proto/new_pixy
    alacritty -e nvim pixy_cam_artifact.ino;;
esac
