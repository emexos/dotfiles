#!/bin/bash

sketchybar --add item front_app left \
  --set front_app background.color=$BAR_COLOR \
                  icon.drawing=off \
                  padding_left=4 \
                  padding_right=4 \
                  label.color=$WHITE \
                  label.padding_left=10 \
                  label.padding_right=10 \
                  script="$PLUGIN_DIR/front_app.sh" \
  --subscribe front_app front_app_switched


#label.color=$BAR_COLOR \
# --set front_app background.color=$ACCENT_COLOR \
