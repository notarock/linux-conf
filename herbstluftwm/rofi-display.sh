#!/bin/bash

display_choices="laptop\nhome\nduplicate\nextend\nmanual"
selection=$(echo -e "$display_choices" | rofi -dmenu )

case $selection in
    laptop) xrandr --output LVDS-0 --auto --pos 0x0  --output VGA-0 --off --output HDMI-0 --off;;
    home)   xrandr --output VGA-0 --pos 0x0 --auto --output LVDS-0 --off --pos 0x0 --output HDMI-0 --off;;
    duplicate) xrandr --output VGA-0 --pos 0x0 --auto --output LVDS-0 --auto --pos 0x0 --output HDMI-0 --auto --pos 0x0 ;;
    extend) xrandr --output VGA-0 --pos 0x0 --auto --output HDMI-0 --auto --pos 1920x0 ;;
    manual) arandr ;;
esac

if [ $(xrandr --query | grep " connected" | cut -d" " -f1 | wc -w ) -eq 2 ] && [ $selection == "extend" ]; then
    herbstclient set_monitors 1920x1052+0+28 1920x1052+1920+28 
else 
    herbstclient set_monitors 1920x1052+0+28
fi
    
