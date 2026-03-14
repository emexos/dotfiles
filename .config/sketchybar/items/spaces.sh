#!/bin/bash

SPACE_SIDS=(1 2 3 4 5 6 7 8 9 10)

sketchybar --add item space_separator left                                  \
          --set space_separator icon=" "                                    \
                                 icon.color=$GRAY                           \
                                 icon.padding_left=-10                       \
                                 icon.padding_right=-10                     \
                                 label.drawing=on                           \
                                 background.drawing=off                     \
           --subscribe space_separator space_windows_change


for sid in "${SPACE_SIDS[@]}"
do
  sketchybar --add space space.$sid left                                    \
             --set space.$sid space=$sid                                    \
                              icon=$sid                                     \
                              label.font="sketchybar-app-font:Regular:16.0" \
                              label="$NAME"                                 \
                              label.padding_left=-3                         \
                              label.y_offset=-10                            \
                              padding_left=0                                \
                              padding_right=0                            \
                              script="$PLUGIN_DIR/space.sh"                 \
                              background.color=$GRAY
done

#sketchybar --add item space_separator left                                  \
#          --set space_separator icon="│"                                    \
#                                 icon.color=$GRAY                           \
#                                 icon.padding_left=10                       \
#                                 icon.padding_right=-10                     \
#                                 label.drawing=on                           \
#                                 background.drawing=off                     \
#                                 #script="$PLUGIN_DIR/space_windows.sh" \
#           --subscribe space_separator space_windows_change
