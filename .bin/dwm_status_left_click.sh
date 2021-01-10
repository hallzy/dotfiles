#!/bin/bash

OPTIONS=$(cat <<EOF
Connect to WiFi
Sleep
EOF
)

choice="$(printf "$OPTIONS" | dmenu -l 10 -c)"

if [ "$choice" = 'Connect to WiFi' ]; then
    "$dotfiles/.bin/wifi-connect"
elif [ "$choice" = 'Sleep' ]; then
    "$dotfiles/.bin/goto_sleep"
fi
