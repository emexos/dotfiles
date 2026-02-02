#!/bin/bash

SPACE_SIDS=(1 2 3 4 5 6 7 8 9 10)

for sid in "${SPACE_SIDS[@]}"
do
  sketchybar --add space space.$sid left                                 \
             --set space.$sid space=$sid                                 \
                              icon=$sid                                  \
                              label.font="sketchybar-app-font:Regular:16.0" \
                              label=" $NAME " \
                              label.padding_left=-10                     \
                              label.y_offset=-10                          \
                              script="$PLUGIN_DIR/space.sh"
done

sketchybar --add item space_separator left                             \
          --set space_separator icon="│"                                \
                                 icon.color=$GRAY \
                                 icon.padding_left=10                   \
                                 icon.padding_right=-10                   \
                                 label.drawing=on                     \
                                 background.color="$BAR_COLOR" \
                                 #script="$PLUGIN_DIR/space_windows.sh" \ nicht wichtig
           --subscribe space_separator space_windows_change
