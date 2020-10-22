#!/bin/bash

DOTFILES="/home/steven/Documents/git-repos/remote-github/dotfiles"

SINK='alsa_output.pci-0000_00_1b.0.analog-stereo'

error() {
    notify-send "Special Keys Error" "$1"
}

voltoggle() {
    pactl set-sink-mute "$SINK" toggle
}

voldown() {
    pactl set-sink-volume "$SINK" '-5%'
}

volup() {
    pactl set-sink-volume "$SINK" '+5%'
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
errmsg="$($1 2>&1)"

if [ $? -ne 0 ]; then
    if [ -z "$errmsg" ]; then
        errmsg="Unknown error"
    fi

    error "${1}(): $errmsg"
fi
