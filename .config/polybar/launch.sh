#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#sleep 3

# Launch bar1 and bar2

polybar top-main -c ~/.config/polybar/config-top.ini &
#polybar bottom-main -c ~/.config/polybar/config-bottom.ini &
if [[ $(xrandr | grep "DP2 connected" | grep -Eiv "eDP1") ]]; then
#   polybar bottom-ext -c ~/.config/polybar/config-bottom.ini &
    polybar top-ext -c ~/.config/polybar/config-top.ini &
fi
