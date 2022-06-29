#!/bin/zsh

# diff -u /usr/share/X11/xkb/symbols/ch ch.modified > ch.diff
# sudo patch /usr/share/X11/xkb/symbols/ch < ch.diff

diff -u /usr/share/X11/xkb/symbols/pc ~/.dotfiles/scripts/keyboard/pc.modified > ~/.dotfiles/scripts/keyboard/pc.diff
sudo patch /usr/share/X11/xkb/symbols/pc < ~/.dotfiles/scripts/keyboard/pc.diff

# restart keyboard
# setxkbmap ch
setxkbmap us

# restart window manager
swaymsg reload


