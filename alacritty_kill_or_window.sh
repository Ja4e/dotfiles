#!/bin/bash
# Get the window ID of the currently focused window
WIN_ID=$(xdotool getwindowfocus)
# Get the window class name of the focused window
WIN_CLASS=$(xprop -id "$WIN_ID" | grep '^WM_CLASS(STRING)' | awk -F'"' '{print $4}')

# Check if the window class name matches 'Alacritty'
if [ "$WIN_CLASS" == "Alacritty" ]; then
    # Close the focused Alacritty window
    xdotool windowclose "$WIN_ID"
else
    # Get the PID of the focused window and kill the process
    WIN_PID=$(xdotool getwindowpid "$WIN_ID")
    kill -9 "$WIN_PID"
fi
# chmod it and assign it to your hotley
