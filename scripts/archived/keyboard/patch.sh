#!/bin/zsh
diff -u /usr/share/X11/xkb/symbols/pc ~/.dotfiles/scripts/keyboard/pc.modified > ~/.dotfiles/scripts/keyboard/pc.diff
sudo patch /usr/share/X11/xkb/symbols/pc < ~/.dotfiles/scripts/keyboard/pc.diff
# restart keyboard
setxkbmap us
# restart window manager
swaymsg reload
