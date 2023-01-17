#!/bin/bash
CONFIG_FILES="$HOME/.config/waybar/config $HOME/.config/waybar/style.css $HOME/.config/waybar/colors.css"

#trap "killall waybar" EXIT
killall waybar
while true; do
    waybar &
    inotifywait -e create,modify $CONFIG_FILES
    killall waybar
done