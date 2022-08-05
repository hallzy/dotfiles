#!/bin/bash

dir=$1
inputFile=$2
outputFile=$3

if ! [ -f "$inputFile" ]; then
    echo "Input file [$inputFile] does not exist";
    exit 1
fi

if [ -f "$outputFile" ]; then
    echo "Output file [$outputFile] already exists";
    exit 1
fi

if [ "$dir" = 'cw' ]; then
    dir=1
elif [ "$dir" = "ccw" ]; then
    dir=2
fi

ffmpeg -i "$inputFile" -vf "transpose=${dir}" "$outputFile"
