#!/bin/bash
search_() {
	con_id="$(swaymsg -t get_tree | jq '
	first(recurse((.nodes + .floating_nodes)[]) |
	select(any(
		.window_properties.class,
		.window_properties.instance,
		.window_properties.window_role,
		.app_id;
		values and match("'"${class:=$1}"'")
	)).id)')"
    echo $con_id
}

swaymsg "workspace 11"
exec alacritty --class STUI -e s-tui &
exec alacritty --class IFTOP -e sudo iftop &
exec alacritty --class HTOP -e htop &
exec alacritty --class IOTOP -e sudo iotop &

sleep 0.4s

id=$(search_ 'IFTOP')
if [ -z "$id" ]
then 
    echo "\$id is invalid."
else
    swaymsg "[con_id=$id]" floating enable, resize set 1400 200, border pixel 5, move absolute position 100 40 &
fi

id=$(search_ 'STUI')
if [ -z "$id" ]
then 
    echo "\$id is invalid."
else
    swaymsg "[con_id=$id]" floating enable, resize set 1500 300, border pixel 5, move absolute position 50 260 &
fi

id=$(search_ 'HTOP')
if [ -z "$id" ]
then 
    echo "\$id is invalid."
else
    swaymsg "[con_id=$id]" floating enable, resize set 700 300, border pixel 5, move absolute position 100 575 &
fi

id=$(search_ 'IOTOP')
if [ -z "$id" ]
then 
    echo "\$id is invalid."
else
    swaymsg "[con_id=$id]" floating enable, resize set 700 300, border pixel 5, move absolute position 810 575 &
fi

