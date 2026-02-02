#!/bin/bash

# Battery
PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ "$PERCENTAGE" != "" ]; then
  case ${PERCENTAGE} in
    #9[0-9]|100) BATT_ICON="􀛨" ;;
    #[6-8][0-9]) BATT_ICON="􀺸" ;;
    #[3-5][0-9]) BATT_ICON="􀺶" ;;
    #[1-2][0-9]) BATT_ICON="􀛩" ;;
    #*) BATT_ICON="􀛪" ;;
    9[0-9]|100) BATT_ICON="bat:" ;;
    [6-8][0-9]) BATT_ICON="bat:" ;;
    [3-5][0-9]) BATT_ICON="bat:" ;;
    [1-2][0-9]) BATT_ICON="bat:" ;;
    *) BATT_ICON="bat:" ;;
  esac

  if [[ $CHARGING != "" ]]; then
    #BATT_ICON="􀢋"
    BATT_ICON="bat:"
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
  #6[0-9]|[7-9][0-9]|100) VOLUME_ICON="􀊩" ;;
  #[3-5][0-9]) VOLUME_ICON="􀊥" ;;
  #[1-2][0-9]) VOLUME_ICON="􀊡" ;;
  #*) VOLUME_ICON="􀊣" ;;
  6[0-9]|[7-9][0-9]|100) VOLUME_ICON="vol:" ;;
  [3-5][0-9]) VOLUME_ICON="vol:" ;;
  [1-2][0-9]) VOLUME_ICON="vol:" ;;
  *) VOLUME_ICON="vol:" ;;
esac

 VOLUME_TEXT="$VOLUME_ICON ${VOLUME}"
#VOLUME_TEXT="$VOLUME_ICON ${VOLUME}%"

#cpu
CORE_COUNT=$(sysctl -n machdep.cpu.thread_count)
CPU_INFO=$(ps -eo pcpu,user)

CPU_SYS=$(echo "$CPU_INFO" | grep -v $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")
CPU_USER=$(echo "$CPU_INFO" | grep $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")

CPU_PERCENT="$(echo "$CPU_SYS $CPU_USER" | awk '{printf "%.0f\n", ($1 + $2)*100}')"

CPU_TEXT="cpu: ${CPU_PERCENT}%"

# Time
TIME=$(date '+%H:%M')

# Combine all
LABEL="$VOLUME_TEXT  /  $BATTERY  /  $TIME "
sketchybar --set bar label="$LABEL"
