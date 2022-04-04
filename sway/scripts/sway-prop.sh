#!/bin/zsh
sleep 2; swaymsg -t get_tree | jq '.. | select(.type?) | select(.focused==true)'
