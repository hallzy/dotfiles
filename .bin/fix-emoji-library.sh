#!/bin/bash

# Ubuntu doesn't have the updated lib xft library that allows emojis, so without
# the new version I manually installed, it will crash st, dmenu, and dwm if an
# emoji is shown.

# Every once in a while the library is overwritten by Ubuntu (I think it happens
# whenever I install or update something and apt replaces the library) so I have
# to manually overwrite it every once in a while.

MANUALLY_INSTALLED_VERSION="/usr/lib/libXft.so.2"

TARGET_LOCATION="/usr/lib/x86_64-linux-gnu/libXft.so.2"
TARGET_LOCATION_BAK="/usr/lib/x86_64-linux-gnu/libXft.so.2.3.3"

if [ ! -f "$MANUALLY_INSTALLED_VERSION" ]; then
    echo "Manually installed version file does not exist [${MANUALLY_INSTALLED_VERSION}]"
    exit 1
fi

if [ ! -f "$TARGET_LOCATION" ]; then
    echo "Target file does not exist [${TARGET_LOCATION}]. Trying backup..."
    if [ ! -f "$TARGET_LOCATION_BAK" ]; then
        echo "Backup Target file also does not exist [${TARGET_LOCATION_BAK}]"
        exit 1
    fi

    TARGET_LOCATION="$TARGET_LOCATION_BAK"
fi

sudo ln -sf "$MANUALLY_INSTALLED_VERSION" "$TARGET_LOCATION"
