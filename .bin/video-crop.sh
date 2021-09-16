#!/bin/bash

file="$1"
output="$2"

if [ -z "$file" ] || ! [ -f "$file" ]; then
    echo "Expected input file and output file. Input file [$file] does not exist"
    exit 1;
fi

if [ -z "$output" ]; then
    echo "Expected input file and output file. Output file not provided"
    exit 1;
fi

save='n'

cropParams="in_w:in_h:0:0"
while [ "$save" != 'y' ] && [ "$save" != 'Y' ]; do
    read -er -p " Crop Params: " -i "$cropParams" cropParams

    ffplay -i "$file" -vf "crop=$cropParams"

    read -er -p "Save cropped file? (y/N/q) ? " save

    if [ "$save" = 'q' ] || [ "$save" = 'Q' ]; then
        exit 0;
    fi
done

ffmpeg -i "$file" -filter:v "crop=$cropParams" "$output"
