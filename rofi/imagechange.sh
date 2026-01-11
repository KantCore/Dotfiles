value="$(grep "$image" ~/.config/hypr/colors.conf | head -n 2 | tail -n 1 | cut -f2 -d"=" | cut -f2 -d" ")"

sed -i "56s|\"[^\"]*\"|\"$value\"|" ~/.config/rofi/config.rasi
sed -i "49s|\"[^\"]*\"|\"$value\"|" ~/.config/rofi/themes/powermenu.rasi
