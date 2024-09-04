#!/bin/bash
switch-profile &

dex -ae qtile -s ~/.config/autostart
# WALLPAPER=$(find ~/repos/wallpapers -type f -name "*jpg" | shuf -n1)
# convert -resize 1920x1080 "$WALLPAPER" ./wall.png
xss-lock --transfer-sleep-lock -- i3lock --nofork -i $HOME/.config/qtile/wall.png &

# /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# picom -b &

