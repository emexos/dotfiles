#!/bin/bash

sketchybar --add item battery right \
           --set battery update_freq=120 \
                         script="$PLUGIN_DIR/battery.sh" \
                         label.color=$RWHITE \
                         icon.color=$WHITE \
                         background.color="$BAR_COLOR" \
           --subscribe battery system_woke power_source_change
