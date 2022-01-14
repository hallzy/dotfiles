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

ffmpeg -i "$file" -vf hflip -c:a copy "$output"
