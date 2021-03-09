#!/bin/bash

# This script is to be used in conjunction with the external pipe feature of st

urlCommon() {
    sed 's/.*│//g' /dev/stdin | \
        tr -d '\n' | \
        grep -aEo '(((http|https)://|www\\.)[a-zA-Z0-9.]*[:]?[a-zA-Z0-9./&%?$#=_-]*)|((magnet:\\?xt=urn:btih:)[a-zA-Z0-9]*)' | \
        uniq | \
        tac | \
        sed 's/^www./http:\/\/www\./g' | \
        dmenu -i -l 10 -p "$1"
}

copyURL() {
    urlCommon "Copy Which URL?" | tr -d '\n' | xclip -selection clipboard
}

openURL() {
    urlCommon 'Follow which url?' | xargs -r xdg-open
}

copydebug() {
    debug
}

opendebug() {
    debug
}

debug() {
    cat /dev/stdin > /tmp/dwm-copy.tmp
    err -w "stdin written to /tmp/dwm-copy.tmp"
}

if [ -z "$1" ]; then
    err -e "You need to specify if this is a 'copy' or 'open' command."
    exit 1
fi

if [ "$1" = "copy" ]; then
    copyURL
    exit 0
elif [ "$1" = "open" ]; then
    openURL
    exit 0
else
    err -e "'$1' is not valid. Must be 'copy' or 'open'"
    exit 1
fi
