#!/usr/bin/env bash
Backgrounds=(~/Pictures/Backgrounds/*)
file=$((0 + RANDOM % ${#Backgrounds[@]}))
path=${Backgrounds[$file]}

hyprctl hyprpaper preload "$path"
hyprctl hyprpaper wallpaper "HDMI-A-1,$path"
hyprctl hyprpaper unload all
