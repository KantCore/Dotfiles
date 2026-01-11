source /home/l/.config/bash/commonscripts.sh

sed -i '1s/.*/layerrule = animation slide, match:namespace rofi/' ~/.config/hypr/modules/layerrule_rofi.conf
dir="/home/l/hyprpaper/"
wallpaper=$(ls $dir | while read A ; do  echo -en "$A\x00icon\x1f$dir$A\n"; done | rofi -dmenu -config /home/l/.config/rofi/themes/wallpaper.rasi)

changeTheme $dir$wallpaper
