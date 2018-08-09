#!/bin/bash

display_choices="100\n75\n50\n25\n2"
selection=$(echo -e "$display_choices" | rofi -dmenu )

xbacklight = $selection
