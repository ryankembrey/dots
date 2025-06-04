#!/bin/sh -x

entries="å\nä\nö\nÅ\nÄ\nÖ"

selected=$(echo -e "$entries" | tofi --prompt "Swedish vowels: " )

case $selected in
    "å")
        echo "å" | wl-copy 
        ;;
    "ä")
        echo "ä" | wl-copy
        ;;
    "ö")
        echo "ö" | wl-copy
        ;;
    "Å")
        echo "Å" | wl-copy
        ;;
    "Ä")
        echo "Ä" | wl-copy
        ;;
    "Ö")
        echo "Ö" | wl-copy
        ;;
    *)
        # Handle cases when no valid option is selected
        echo "Invalid selection"
        ;;
esac
