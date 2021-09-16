#!/bin/bash

echo "Calculating hashes for files, please wait..."
fileHashes="$(crc32 "$@")"
# fileHashes="$(md5sum "$@")"
echo "Hashes complete!"

echo"";
echo "Duplicates:"

echo "$fileHashes" | awk '
    {
        hash = $1;
        $1 = "";

        gsub(/^\s*/, "", $0);
        gsub(/\s*$/, "", $0);

        map[hash] = map[hash] (map[hash] ? ",,,," : "") $0
    }

    END {
        for (key in map) {
            size = split(map[key], filenames, ",,,,");

            if (size <= 1) {
                continue;
            }

            print ""
            for (idx in filenames) {
                print filenames[idx];
            }
        }
    }
';
