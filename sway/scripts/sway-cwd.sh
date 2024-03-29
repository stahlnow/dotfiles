#!/usr/bin/env bash

terminal=${1:-kitty}
pid=$(swaymsg -t get_tree | jq '.. | select(.type?) | select(.type=="con") | select(.focused==true).pid')
pname=$(ps -p ${pid} -o comm= | sed 's/-$//')

if [[ $pname == $terminal ]]
then
  ppid=$(pgrep --newest --parent ${pid})
  readlink /proc/${ppid}/cwd || echo $HOME
else
  echo $HOME
fi
