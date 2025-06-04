#!/bin/bash

# if [[ "$(playerctl --player=mpv metadata)" == "No players found" ]]; then
#     # Remove the album art from /tmp/waybar if no player is found
#     rm -f /tmp/waybar/album_art.jpg
#     # Optionally, refresh Waybar (without album art)
#     pkill -SIGRTMIN+10 waybar
#     # Add and then remove a comment in the style.css to trigger Waybar refresh
#     echo "/* Refresh */" >> ~/.config/waybar/style.css   # Add comment to file
#     sed -i '$d' ~/.config/waybar/style.css              # Remove the last line (comment)
#
# fi

# Define the file that stores the last album art URL
# ALBUM_ART_CACHE="/tmp/waybar/album_art_cache.txt"

# Get the title, artist, and track ID from playerctl
title=$(playerctl --player=mpv metadata title 2>/dev/null || echo "")
artist=$(playerctl --player=mpv metadata artist 2>/dev/null || echo "")
track="${track_id//[^0-9]/}"
track=$((track + 1))

# # Get the album art URL from playerctl
# album_art_url=$(playerctl --player=mpv metadata mpris:artUrl 2>/dev/null)
#
# # Check if album art URL is retrieved
# if [[ -z "$album_art_url" ]]; then
#   echo "No album art URL found"
#   exit 1
# fi

# # Remove the file:// prefix
# album_art_url=${album_art_url#file://}
#
# # Replace URL-encoded spaces (%20) with actual spaces
# album_art_url=$(echo "$album_art_url" | sed 's/%20/ /g')
#
# # Check if the file exists
# if [[ ! -f "$album_art_url" ]]; then
#   echo "Album art file not found at $album_art_url"
#   exit 1
# fi
#
# # Create the /tmp/waybar directory if it doesn't exist
# mkdir -p /tmp/waybar
#
# # Read the cached album art URL (if any)
# if [[ -f "$ALBUM_ART_CACHE" ]]; then
#   cached_album_art_url=$(<"$ALBUM_ART_CACHE")
# else
#   cached_album_art_url=""
# fi
#
# # Compare the current album art URL with the cached one
# if [[ "$album_art_url" != "$cached_album_art_url" ]]; then
#   # Only copy the album art if it has changed
#   cp "$album_art_url" /tmp/waybar/album_art.jpg
#
#   # Update the cache with the new album art URL
#   echo "$album_art_url" > "$ALBUM_ART_CACHE"
#   # Add and then remove a comment in the style.css to trigger Waybar refresh
#     echo "/* Refresh */" >> ~/.config/waybar/style.css   # Add comment to file
#     sed -i '$d' ~/.config/waybar/style.css              # Remove the last line (comment)
# fi

# Output JSON for Waybar with dynamic text, icon, and background-image for album art



jq -n --compact-output --unbuffered \
  --arg title "$title" \
  --arg artist "$artist" \
  '{
    "text": ($title | select(length > 0) | . + " - " + $artist // "") 
  }'

