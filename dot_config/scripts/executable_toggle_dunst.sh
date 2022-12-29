#!/bin/bash

status=$(dunstctl is-paused)

if [[ "$status" == "false" ]]; then
    notify-send -t 3000 "Notifications Disabled"
    sleep 3s
    dunstctl set-paused true
else
    dunstctl set-paused false
    notify-send -t 3000 "Notifcations Enabled"
fi
