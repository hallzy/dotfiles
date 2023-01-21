#!/bin/bash

for fullFile in "${@}"; do
    filename=$(basename -- "$fullFile")
    extension="${filename##*.}"
    filename="${filename%.*}"

    artist="$(echo "${filename}" | awk -F ' - ' '{ print $1 }')"
    title="$(echo "${filename}" | awk -F ' - ' '{ print $2 }')"

    echo "Artist: $artist"
    echo "Song:   $title"
    echo ""
    mp3tag -a "${artist}" -s "${title}" "${fullFile}"
done
