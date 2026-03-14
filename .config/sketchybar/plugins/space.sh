#!/bin/sh

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

source "$CONFIG_DIR/colors.sh"

SID="${NAME#*.}"

if [ "$SELECTED" = true ]; then
  sketchybar --set "$NAME" background.color=$RWHITE \
                         icon="$SID" \
                         label.color="$RBLACK" \
                         icon.color="$RBLACK"

else
  sketchybar --set "$NAME" background.color=$GRAY \
                         icon="$SID" \
                         label.color="$RWHITE" \
                         icon.color="$RWHITE"
fi
