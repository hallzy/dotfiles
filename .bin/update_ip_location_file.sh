#!/bin/bash

# THIS SCRIPT IS INTENDE TO BE USED IN A CRONJOB

BIN="/home/steven/Documents/git-repos/remote-github/dotfiles/.bin"
FILE='/mnt/2AD8624BD86214FB/Users/Steven/ip_location'

CONTENTS="$(cat "$FILE")"

NEW_LOC="$($BIN/get_ip_location.sh)"

if [ "$CONTENTS" = "$NEW_LOC" ]; then
    exit 0;
fi


if [ -z "$NEW_LOC" ]; then
    exit 0;
fi

echo "$NEW_LOC" > "$FILE"
