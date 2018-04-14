#! /bin/bash

display_choices="laptop\nhome\nduplicate\nmanual"
selection=$(echo -e "$display_choices" | rofi -dmenu )

case $selection in
    laptop) xrandr --output LVDS-0 --auto --pos 0x0  --output VGA-0 --off ;;
    home)   xrandr --output VGA-0 --pos 0x0 --auto --output LVDS-0 --off --pos 0x0 ;;
    duplicate) xrandr --output VGA-0 --pos 0x0 --auto --output LVDS-0 --auto --pos 0x0 ;;
    manual) arandr ;;
esac
