#!/bin/bash

DOTFILES="/home/steven/Documents/git-repos/remote-github/dotfiles"

debug() {
    notify-send "Special Keys Debug" "$1"
}

voltoggle() {
    pactl set-sink-mute 0 toggle
    # debug "volume toggle"
}

voldown() {
    pactl set-sink-volume 0 '-5%'
    # debug "volume down"
}

volup() {
    pactl set-sink-volume 0 '+5%'
    # debug "volume up"
}

changeBrightness() {
    local brightness
    local max
    local new
    local sign

    sign="$1"

    brightness="$(cat /sys/class/backlight/intel_backlight/brightness)"
    max="$(cat /sys/class/backlight/intel_backlight/max_brightness)"

    new=$(python -c "print $brightness $sign 75")

    # Convert to int
    if [ "$new" -lt 0 ]; then
        new=0
    elif [ "$new" -gt "$max" ]; then
        new="$max"
    fi

    "$DOTFILES/backlight-wrapper/backlight-wrapper" "$new"
}

brightup() {
    changeBrightness '+'
}

brightdown() {
    changeBrightness '-'
}


## Argument to script call is one of the above functions
$1
