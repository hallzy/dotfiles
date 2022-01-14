#!/bin/bash

# mpv doesn't read exif information for jpg images, so any orientation change in
# the image that is made in the exif metadata is ignored.

# This script is used to read the exif information for jpg images, and remove
# that exif information and do an actual conversion on the image to rotate the
# image itself so that it shows correctly in mpv.

# There is an open ticket in ffmpeg for this which has been there for 3 years at
# time of writing, so doesn't seem like it is going to go anywhere anytime soon.

path="$*"

if [ -z "$path" ]; then
    path="."
fi

while read -r file; do
    if ! [ -f "$file" ]; then
        echo "Error: [$file] is not a file";
        continue;
    fi

    orientation="$(exiftool -Orientation -S -n "$file" | awk '{ print $2 }')"
    if [ -z "$orientation" ] || [ "$orientation" = 1 ]; then
        continue;
    fi

    if [ "$orientation" = 5 ] || [ "$orientation" = 6 ]; then
        convert "$file" -rotate 90 "$file"
    elif [ "$orientation" = 3 ] || [ "$orientation" = 4 ]; then
        convert "$file" -rotate 180 "$file"
    elif [ "$orientation" = 7 ] || [ "$orientation" = 8 ]; then
        convert "$file" -rotate 270 "$file"
    fi

    if [ "$orientation" = 2 ] || [ "$orientation" = 4 ] || [ "$orientation" = 5 ] || [ "$orientation" = 7 ]; then
        convert -flop "$file" "$file"
    fi
    exiftool -Orientation=1 -n "$file"
    rm "${file}_original"
    echo "$file"
done < <(find $path -type f -iname "*.jpg");

err "Rotate Done"
