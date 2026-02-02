#!/bin/sh

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

source "$CONFIG_DIR/colors.sh"

SID="${NAME#*.}"

if [ "$SELECTED" = true ]; then
  sketchybar --set "$NAME" background.drawing=on \
                         background.color="$BAR_COLOR" \
                         icon="* $SID" \
                         label.color="$WHITE" \
                         icon.color="$WHITE"
else
  sketchybar --set "$NAME" background.drawing=off \
                         icon="$SID" \
                         label.color="$ACCENT_COLOR" \
                         icon.color="$ACCENT_COLOR"
fi
