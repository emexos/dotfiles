#!/bin/bash

ICON_PATH="$HOME/.config/sketchybar/icons/arch.png"
CLICK_SCRIPT="$HOME/.config/sketchybar/plugins/label.sh"

sketchybar --add item arch_button left \
           --set arch_button \
               icon.drawing=off \
               background.drawing=on \
               background.image="$ICON_PATH" \
               background.image.scale=0.078 \
               background.image.padding_left=9 \
               background.image.padding_right=9 \
               background.padding_left=-9 \
               background.padding_right=3 \
               background.height=27 \
               background.corner_radius=15 \
               click_script="$CLICK_SCRIPT"
