#!/bin/bash

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"

# [
sketchybar --add item bar_end right \
           --set bar_end label="]" \
                          label.color=$GRAY \
                          background.color="$BAR_COLOR" \
                          padding_left=-18 \
                          padding_right=-10

#sketchybar --add item time right \
#           --set time script="$PLUGIN_DIR/time.sh" \
#                          update_freq=2 \
#                          label.color=$RWHITE \
#                          icon.color=$WHITE \
#                          background.color="$BAR_COLOR" \

# time
#sketchybar --add item time right \
#           --set time label="$(date '+%H:%M')" \
#                           script="$PLUGIN_DIR/time.sh" \
#                           update_freq=60 \
#                           label.color=$RWHITE \
#                           icon.color=$WHITE \
#                           background.color="$BAR_COLOR" \
#                           padding_left=-18 \
#                           padding_right=1 #\
#           #--subscribe time system_woke power_source_change volume volume_change
#sketchybar --subscribe time system_woke

#sketchybar --add item time right \
#           --set time script="$PLUGIN_DIR/time.sh" \
#                       label="+%H:%M" \
#                       update_freq=60 \
#                       label.color=$RWHITE \
#                       icon.color=$WHITE \
#                       background.color="$BAR_COLOR" \
#                       padding_left=5 \
#                       padding_right=5
#sketchybar --update
# /
#sketchybar --add item bar_sep3 right \
#           --set bar_sep3 label=" / " \
#                          label.color=$GRAY \
#                          icon.color=$WHITE \
#                          background.color="$BAR_COLOR" \
#                          padding_left=0 \
#                          padding_right=-2
# CPU
sketchybar --add item bar_cpu right \
           --set bar_cpu script="$PLUGIN_DIR/cpu.sh" \
                          update_freq=2 \
                          icon=cpu:  \
                          label.color=$RWHITE \
                          icon.color=$WHITE \
                          background.color="$BAR_COLOR" \
                          padding_left=1 \
                          #padding_right=-18

# /
sketchybar --add item bar_sep1 right \
           --set bar_sep1 label=" / " \
                          label.color=$GRAY \
                          icon.color=$WHITE \
                          background.color="$BAR_COLOR" \
                          padding_left=-20 \
                          padding_right=-10

sketchybar --add item battery right \
           --set battery update_freq=120 \
                         script="$PLUGIN_DIR/battery.sh" \
                         label.color=$RWHITE \
                         icon.color=$WHITE \
                         background.color="$BAR_COLOR" \
           --subscribe battery system_woke power_source_change

# /
sketchybar --add item bar_sep2 right \
           --set bar_sep2 label=" / " \
                          label.color=$GRAY \
                          icon.color=$WHITE \
                          background.color="$BAR_COLOR" \
                          padding_left=-20 \
                          padding_right=-10

sketchybar --add item volume right \
           --set volume script="$PLUGIN_DIR/volume.sh" \
                          label.color=$RWHITE \
                          icon.color=$WHITE \
                          background.color="$BAR_COLOR" \
           --subscribe volume volume_change

# [
sketchybar --add item bar_open right \
           --set bar_open label="[" \
                          label.color=$GRAY \
                          background.color="$BAR_COLOR" \
                          padding_left=-18 \
                          padding_right=-12

sketchybar --update
