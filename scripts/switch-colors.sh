#!/bin/zsh

if [[ $# -eq 0 ]] ; then
    # list colors
    curl -sL https://github.com/aaron-williamson/base16-alacritty/tree/master/colors | grep -Po '"base16-\K.*?(?=.yml)'
    exit 0
fi

case "$1" in
    # set alacritty colors
    *) curl https://raw.githubusercontent.com/aaron-williamson/base16-alacritty/master/colors/base16-$1.yml > ~/.config/alacritty/colors.yml ;;

esac

