#!/bin/bash

# Get the directory of the currently edited file in Neovim
dir=$(dirname "$(realpath "$1")")

# Open a new Alacritty terminal window and navigate to the directory
alacritty -e sh -c "cd '$dir' && exec $SHELL"
