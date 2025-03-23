#!/bin/bash

usage() {
    echo ""
    echo "rotate-video.sh <cw|ccw> <input file> <output file>"
}

dir=$1
inputFile=$2
outputFile=$3

if [ "$dir" = 'cw' ]; then
    dir=1
elif [ "$dir" = "ccw" ]; then
    dir=2
else
    echo "Unknown Direction [$dir]";
    usage
    exit 1
fi

if ! [ -f "$inputFile" ]; then
    echo "Input file [$inputFile] does not exist";
    usage
    exit 1
fi

if [ -f "$outputFile" ]; then
    echo "Output file [$outputFile] already exists";
    usage
    exit 1
fi

ffmpeg -i "$inputFile" -vf "transpose=${dir}" "$outputFile"
