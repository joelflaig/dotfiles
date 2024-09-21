#! /usr/bin/bash

wallpaper_fold=~/Pictures/wallpapers/
wallpaper_loc="$(ls $wallpaper_fold | wofi -IGp wallpapers --show dmenu)"

if [[ -f $wallpaper_fold/$wallpaper_loc ]]; then
  notify-send "Setting wallpaper"
  notify-send $(swww img $wallpaper_fold/$wallpaper_loc --transition-type center)
  notify-send "Wallpaper set"
elif [[ -d $wallpaper_fold/$wallpaper_loc ]]; then
  notify-send "Error: selected wallpaper is a folder"
else
  notify-send "Error"
  exit 1
fi

