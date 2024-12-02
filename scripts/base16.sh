#!/usr/bin/sh

# Test if theme exists
# string url
# string theme
# string pattern
check_theme_exists() {
	check=$(curl -sL "$1" | grep -Po "$3" | grep -x "$2")
	if [[ -z $check  ]]; then
		printf "theme not found"
		return 1
	fi
	return 0
}

# Install kitty theme
# string theme
kitty() {
	theme=$1
	url=https://github.com/kdrag0n/base16-kitty/tree/master/colors
	pat='"base16-\K.*?(?=.conf)'

	if [ -z "$theme" ]; then
		curl -sL $url | grep -Po $pat
	else
		check=$(check_theme_exists $url $theme $pat)
		if [[ -z "$check" ]]; then
			printf "install $theme for kitty.\n"
			curl -sf https://raw.githubusercontent.com/kdrag0n/base16-kitty/master/colors/base16-$theme.conf > ~/.config/kitty/base16-theme.conf
      kill -USR1 $(pgrep kitty)
		else
			printf "install $theme for kitty failed.\n"
		fi
	fi
	return 0
}

waybar() {
	theme=$1
	url=https://github.com/mnussbaum/base16-waybar/tree/master/colors
	pat='"base16-\K.*?(?=.css)'

	if [ -z "$theme" ]; then
		curl -sL $url | grep -Po $pat
	else
		check=$(check_theme_exists $url $theme $pat)
		if [[ -z "$check" ]]; then
			printf "install $theme for waybar.\n"
			curl -sf https://raw.githubusercontent.com/mnussbaum/base16-waybar/master/colors/base16-$theme.css > ~/.config/waybar/colors.css
		else
			printf "install $theme for waybar failed.\n"
		fi
	fi
	return 0
}

sway() {
	theme=$1
	url=https://github.com/rkubosz/base16-sway/tree/master/themes
	pat='"base16-\K.*?(?=.config)'

	if [ -z "$theme" ]; then
		curl -sL $url | grep -Po $pat
	else
		check=$(check_theme_exists $url $theme $pat)
		if [[ -z "$check" ]]; then
			printf "install $theme for sway.\n"
			curl -f --silent https://raw.githubusercontent.com/rkubosz/base16-sway/master/themes/base16-$theme.config > ~/.config/sway/colorscheme
			swaymsg reload
		else
			printf "install $theme for sway failed.\n"
		fi
	fi
	return 0
}

vim() {
	theme=$1
	url=https://github.com/RRethy/nvim-base16/tree/master/colors
	pat='"base16-\K.*?(?=.vim)'

	if [ -z "$theme" ]; then
		curl -sL $url | grep -Po $pat
	else
		check=$(check_theme_exists $url $theme $pat)
		if [[ -z "$check" ]]; then
			printf "install $theme for vim.\n"
      # replace theme in colorschemes.lua
      sed -i -e "s/vim\.cmd\.colorscheme(\"base16-[^\"]*\")/vim.cmd.colorscheme(\"base16-$theme\")/" $HOME/.config/nvim/lua/colorschemes.lua
			# reload colorschemes.lua module
			for path in $(/usr/bin/nvr --nostart --serverlist)
			do
        /usr/bin/nvr --nostart --servername $path -c "lua package.loaded['colorschemes'] = nil" # remove it from cache
        /usr/bin/nvr --nostart --servername $path -c "lua require('colorschemes')" # load it
			done
		else
			printf "install $theme for vim failed.\n"
		fi
	fi
	return 0

}

if [ $# -lt 1 -o $# -gt 2 ] ; then
	printf "usage: %s <app> [theme]\n" "$(basename "$0")"
  printf "app can be one of: 'vim', 'kitty', 'waybar', 'sway'.\n"
  printf "'all' can be used to apply the theme for all apps.\n"
  printf "when theme is omitted, available themes are listed.\n"
	exit 0
else
	prog=$1
	theme=$2
	case $prog in
		"all")
			vim $theme
      if [ -z "$theme" ]; then
        echo "note: themes for vim were listed as reference"
        exit 0
      fi
			kitty $theme
			waybar $theme
			sway $theme
			;;

		"kitty")
			kitty $theme
			;;
		"waybar")
			waybar $theme
			;;
		"sway")
			sway $theme
			;;
		"vim")
			vim $theme
			;;
		esac
		exit 0
fi


# vi:syntax=bash:
