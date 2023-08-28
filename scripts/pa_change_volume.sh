#!/bin/zsh
# change volume (as command argument, ie +5%) for all sinks
for sink in $(pactl list sinks | grep 'Name:'| cut -b8-)
do
  pactl set-sink-volume $sink $1
done
