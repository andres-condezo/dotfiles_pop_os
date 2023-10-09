#!/bin/bash
sleep 0.5s 
xdotool key ctrl+a
xdotool key ctrl+c
kitty -- nvim -c startinsert &
sleep 0.5s 
xdotool key shift+Insert 
# sleep 1 
# xdotool key super+g
wait
sleep 0.5s 
xdotool key ctrl+v
