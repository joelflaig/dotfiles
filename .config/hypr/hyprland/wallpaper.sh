#!/bin/bash
WALLPAPERS_DIR=$HOME/Pictures/wallpapers

rofi_cmd() {
	rofi -dmenu \
    -i \
    -theme ~/.config/rofi/themes/wall.rasi
}

for wallpaper in "$WALLPAPERS_DIR"; do
  if [ -f "$wallpaper" ]; then
    wallpaper_name=$(basename "$wallpaper")
  fi
done

selected_wallpaper=$(find "${WALLPAPERS_DIR}" -type f -printf "%P\n" | sort | while read -r A ; do echo -en "$A\x00icon\x1f""${WALLPAPERS_DIR}"/"$A\n" ; done | rofi_cmd)

if [[ $selected_wallpaper == "" ]]; then
  exit 1
fi

swww img $WALLPAPERS_DIR/$selected_wallpaper -t any

