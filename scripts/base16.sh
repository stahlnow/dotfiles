#!/usr/bin/zsh

if [[ $# -eq 0 ]] ; then
    # list colors
    curl -sL https://github.com/aaron-williamson/base16-alacritty/tree/master/colors | grep -Po '"base16-\K.*?(?=.yml)'

    # print the current colors
    for i in {0..15} ; do
        printf "\x1b[48;5;%sm%3x\e[0m " "$i" "$i"
    done
    printf "\n";
    exit 0
fi

case "$1" in
    *)
        theme=$1
        echo setting theme to $theme
        curl -f --silent https://raw.githubusercontent.com/rkubosz/base16-sway/master/themes/base16-$theme.config > ~/.config/sway/colorscheme 
        curl -f --silent https://raw.githubusercontent.com/aarowill/base16-alacritty/master/colors/base16-$theme.yml > ~/.config/alacritty/include/colors.yml
        curl -f --silent https://raw.githubusercontent.com/mnussbaum/base16-waybar/master/colors/base16-$theme.css > ~/.config/waybar/colors.css

        # generate .vimrc_background
        echo -e "if \0041exists('g:colors_name') || g:colors_name != 'base16-$theme'\n  colorscheme base16-$theme\nendif" >| ~/.vimrc_background
        # reload vim configs
        for path in $(/usr/bin/nvr --nostart --serverlist)
        do
          /usr/bin/nvr --nostart --servername $path -cc 'so ~/.config/nvim/init.vim'
        done

        /usr/bin/swaymsg reload
        ;;
esac
