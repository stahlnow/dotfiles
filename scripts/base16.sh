#!/bin/zsh

if [[ $# -eq 0 ]] ; then
    # list colors
    curl -sL https://github.com/aaron-williamson/base16-alacritty/tree/master/colors | grep -Po '"base16-\K.*?(?=.yml)'
    exit 0
fi

case "$1" in
    *)
        theme=$1
        echo setting theme to $theme
        curl -f --silent https://raw.githubusercontent.com/rkubosz/base16-sway/master/themes/base16-$theme.config > ~/.config/sway/include/colorscheme 
        curl -f --silent https://raw.githubusercontent.com/aarowill/base16-alacritty/master/colors/base16-$theme.yml > ~/.config/alacritty/colors.yml
        curl -f --silent https://raw.githubusercontent.com/mnussbaum/base16-waybar/master/colors/base16-$theme.css > ~/.config/waybar/colors.css
        # generate .vimrc_background
        echo -e "if \0041exists('g:colors_name') || g:colors_name != 'base16-$theme'\n  colorscheme base16-$theme\nendif" >| ~/.vimrc_background
        swaymsg reload
        ;;
esac
