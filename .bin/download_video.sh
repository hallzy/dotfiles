#!/bin/bash

start="$1"
duration="$2"
url="$3"
output="$4"

if [ -z "$start" ]; then
    echo "Missing start time -> script start duration url output"
    exit 1
fi

if [ -z "$duration" ]; then
    echo "Missing duration -> script start duration url output"
    exit 1
fi

if [ -z "$url" ]; then
    echo "Missing url -> script start duration url output"
    exit 1
fi

if [ -z "$output" ]; then
    echo "Missing output -> script start duration url output"
    exit 1
fi

streams="$(youtube-dl --youtube-skip-dash-manifest -g "${url}")"

videoStream="$(echo "$streams" | head -n 1)"
audioStream="$(echo "$streams" | tail -n 1)"

ffmpeg -ss "$start" -i "$videoStream" -ss "$start" -i "$audioStream" -t "$duration" -map 0:v -map 1:a -c:v libx264 -c:a aac "$output"
