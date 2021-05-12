#!/bin/zsh

# diff -u /usr/share/X11/xkb/symbols/ch ch.modified > ch.diff
# sudo patch /usr/share/X11/xkb/symbols/ch < ch.diff

diff -u /usr/share/X11/xkb/symbols/pc pc.modified > pc.diff
sudo patch /usr/share/X11/xkb/symbols/pc < pc.diff

# restart keyboard
# setxkbmap ch
setxkbmap us

# restart window manager
# swaymsg reload
i3-msg reload


