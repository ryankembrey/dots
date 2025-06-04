#!/bin/sh

FILE="$1"

# Check if the file contains the required line
while true; do
  if grep -q "from build123d import *" "$FILE"; then
    # Run the script in the background and redirect output to a log file
    python "$FILE" > /tmp/nvim_auto_run.log 2>&1 &
  fi
  sleep 4
done

