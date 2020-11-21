#!/bin/bash

DOTFILES="/home/steven/Documents/git-repos/remote-github/dotfiles"

MOUSE_MOVE_SPEED=40

# SINK='alsa_output.pci-0000_00_1b.0.analog-stereo'
# SINK='alsa_output.pci-0000_00_1f.3.analog-stereo'

SINK="$(pacmd list-cards | awk '
    BEGIN {
        FOUND_SINK = 0;
    }

    $1 == "sinks:" {
        FOUND_SINK = 1;
        next;
    }

    FOUND_SINK == 1 {
        gsub(/\/.*$/, "", $1);
        print $1;
        exit;
    }
')"

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

    new=$(echo "$brightness $sign 75" | bc)

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

mouseleft() {
    xdotool mousemove_relative -- "-${MOUSE_MOVE_SPEED}" 0
}

mouseright() {
    xdotool mousemove_relative -- "${MOUSE_MOVE_SPEED}" 0
}

mouseup() {
    xdotool mousemove_relative -- 0 "-${MOUSE_MOVE_SPEED}"
}

mousedown() {
    xdotool mousemove_relative -- 0 "${MOUSE_MOVE_SPEED}"
}


## Argument to script call is one of the above functions
errmsg="$($1 2>&1)"

if [ $? -ne 0 ]; then
    if [ -z "$errmsg" ]; then
        errmsg="Unknown error"
    fi

    error "${1}(): $errmsg"
fi
