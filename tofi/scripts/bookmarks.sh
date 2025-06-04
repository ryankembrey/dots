#!/bin/sh -x

entries="Canvas\nWebsite\nCitrix\nYouTube\nGithub\nRoms\nLinear_Algebra"

selected=$(echo -e $entries|tofi --prompt "Bookmarks: " | awk '{print tolower($1)}')

case $selected in
    canvas)
        exec firefox --new-window https://login.uts.edu.au/ ; sleep 6 ;  echo "ryan.kembrey@student.uts.edu.au" | wl-copy | wl-paste;;
    citrix)
        exec firefox https://utsworkspace.cloud.com/Citrix/StoreWeb/;; 
    youtube)
        exec firefox --new-window https://www.youtube.com;;
    github)
        exec firefox https://www.github.com/ryankembrey;;
    website)
        exec firefox https://ryankembrey.github.io;;
    roms)
        exec firefox https://r-roms.github.io/megathread/sony/#sony-playstation-2;;
    linear_algebra)
        exec firefox https://www.youtube.com/playlist?list=PLE7DDD91010BC51F8
esac
