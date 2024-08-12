#!/bin/sh

export MOZ_DISABLE_RDD_SANDBOX=1
export LIBVA_DRIVER_NAME=nvidia
export AWT_TOOLKIT=MToolkit
export _JAVA_AWT_WM_NONREPARENTING=1

easyeffects --gapplication-service &
nitrogen --restore &
numlockx &
picom -b &
ckb-next -b &
flameshot &
dunst &
udiskie &
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
nm-applet &
