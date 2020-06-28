#!/bin/bash

# this script is intended to be run in a cron job to update a file. That file
# can then be read by something like slstatus to read an RTT

FILE='/mnt/2AD8624BD86214FB/Users/Steven/ping'

# If ping succeeds, then exit and update ping time
OUT="$(ping -c 1 google.ca)"
if [ $? -eq 0 ]; then
    echo "$OUT" | awk -F '[/ ]' 'END {print $8 " " $11}' >  "$FILE"
    exit 0;
fi

# If ping failed, then try again
OUT="$(ping -c 1 google.ca)"
if [ $? -eq 0 ]; then
    echo "$OUT" | awk -F '[/ ]' 'END {print $8 " " $11}' >  "$FILE"
    exit 0;
fi

# If ping failed again, then try 1 more time
OUT="$(ping -c 1 google.ca)"
if [ $? -eq 0 ]; then
    echo "$OUT" | awk -F '[/ ]' 'END {print $8 " " $11}' >  "$FILE"
    exit 0;
fi

# If it still fails then just say there is no internet
echo "No Internet" > "$FILE"
