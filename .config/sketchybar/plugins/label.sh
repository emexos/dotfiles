#!/usr/bin/env bash

ICON_NORMAL="$HOME/.config/sketchybar/icons/arch.png"
ICON_BRIGHT="$HOME/.config/sketchybar/icons/arch_bright.png"
ITEM="arch_button"

sketchybar --set "$ITEM" \
               background.color=0x45abf0eb \
               background.image="$ICON_BRIGHT"
#start
#SCRIPT_DIR="$(cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P)"
#"$SCRIPT_DIR/../programms/zgrees" &


#(
#  sleep 0.1
#  sketchybar --set "$ITEM" \
#    background.color=0x35abf0eb \
#    background.image="$ICON_NORMAL"
#) &

exit 0
