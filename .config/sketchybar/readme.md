    ich benutze sketchybar und ich will ein button machen den man klicken kann und der als icon eine png hat von der man die gröse bestimmen kann hier mal etwas was ich bisher gemacht hab dieses design soll es haben:

    items/bar.sh
    #!/bin/bash

    PLUGIN_DIR="$HOME/.config/sketchybar/plugins"

    sketchybar --add item bar right \
            --set bar script="$PLUGIN_DIR/bar.sh" \
                        update_freq=20 \
            --subscribe bar system_woke power_source_change volume volume_change

    plugins/bar.sh
    #!/bin/bash

    # Battery
    PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
    CHARGING=$(pmset -g batt | grep 'AC Power')

    if [ "$PERCENTAGE" != "" ]; then
    case ${PERCENTAGE} in
        9[0-9]|100) BATT_ICON="􀛨" ;;
        [6-8][0-9]) BATT_ICON="􀺸" ;;
        [3-5][0-9]) BATT_ICON="􀺶" ;;
        [1-2][0-9]) BATT_ICON="􀛩" ;;
        *) BATT_ICON="􀛪" ;;
    esac

    if [[ $CHARGING != "" ]]; then
        BATT_ICON=""
    fi

    BATTERY="$BATT_ICON ${PERCENTAGE}"
    # BATTERY="$BATT_ICON ${PERCENTAGE}%"
    else
    BATTERY=""
    fi

    # Volume
    VOLUME_ICON=""
    if [ "$SENDER" = "volume_change" ]; then
    VOLUME=$INFO
    else
    VOLUME=$(osascript -e "output volume of (get volume settings)")
    fi

    case $VOLUME in
    6[0-9]|[7-9][0-9]|100) VOLUME_ICON="􀊩" ;;
    [3-5][0-9]) VOLUME_ICON="􀊥" ;;
    [1-2][0-9]) VOLUME_ICON="􀊡" ;;
    *) VOLUME_ICON="􀊣" ;;
    esac

    VOLUME_TEXT="$VOLUME_ICON ${VOLUME}"
    #VOLUME_TEXT="$VOLUME_ICON ${VOLUME}%"

    # Time
    TIME=$(date '+%H:%M')

    # Combine all
    LABEL="$VOLUME_TEXT  -  $BATTERY  -  $TIME  -"
    sketchybar --set bar label="$LABEL"