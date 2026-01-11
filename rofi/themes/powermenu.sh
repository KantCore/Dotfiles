
sed -i '1s/.*/layerrule = animation popin 80%, match:namespace rofi/g' ~/.config/hypr/modules/layerrule_rofi.conf
variable="$(echo "|󰤄|" | rofi -sep '|' -dmenu -config powermenu.rasi)"

case $variable in
    "")
    (hyprlock &) && exit
    ;;

    "󰤄")
    ((hyprlock &) && exit) && systemctl suspend
    ;;

    "")
    systemctl poweroff
    ;;
esac
