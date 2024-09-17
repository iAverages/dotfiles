#!/usr/bin/env bash

# wallpaper
swww-daemon &

# Network shit
nm-applet &

# Script handles auto reloading
~/.scripts/launch-waybar &

# Sets random wallpaper from folder
~/.scripts/set-wallpaper &

dunst
