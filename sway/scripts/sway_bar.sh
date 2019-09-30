# Date and time
# date_and_week=$(date "+%Y/%m/%d (w%-V)")
date=$(date "+%d.%m.%Y")
current_time=$(date "+%H:%M")

# Battery or charger
battery_charge=$(upower --show-info $(upower --enumerate | grep 'BAT') | egrep "percentage" | awk '{print $2}')
battery_status=$(upower --show-info $(upower --enumerate | grep 'BAT') | egrep "state" | awk '{print $2}')

# Audio and multimedia
#audio_volume=$(pamixer --sink `pactl list sinks short | grep RUNNING | awk '{print $1}'` --get-volume)
audio_volume=$(pamixer --get-volume)
#audio_is_muted=$(pamixer --sink `pactl list sinks short | grep RUNNING | awk '{print $1}'` --get-mute)
audio_is_muted=$(pamixer --get-mute)
media_artist=$(playerctl metadata artist)
media_song=$(playerctl metadata title)
player_status=$(playerctl status)

# Network
network=$(ip route get 1.1.1.1 | grep -Po '(?<=dev\s)\w+' | cut -f1 -d ' ')
# interface_easyname grabs the "old" interface name before systemd renamed it
interface_easyname=$(dmesg | grep $network | grep renamed | awk 'NF>1{print $NF}')

if [ $battery_status = "discharging" ];
then
    battery_pluggedin=''
else
    battery_pluggedin='⚡'
fi

if ! [ $network ]
then
   network_active="kei netz, scheisse!"
else
   network_active=""
fi

if [ $player_status = "Playing" ]
then
    song_status=''
elif [ $player_status = "Paused" ]
then
    song_status=''
else
    song_status=''
fi

if [ $audio_is_muted = "true" ]
then
    audio_active=''
else
    audio_active=''
fi

#echo "$song_status $media_artist - $media_song | $network_active $interface_easyname | $audio_active $audio_volume% | $battery_pluggedin $battery_charge | $date $current_time"
echo "$audio_active $audio_volume% | $network_active $interface_easyname | $battery_pluggedin $battery_charge | $date $current_time"
