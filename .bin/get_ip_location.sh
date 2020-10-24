#!/bin/bash

# echo "ipinfo.io down"
# exit 0

curl ipinfo.io 2> /dev/null | jq -r '.city, .country' 2> /dev/null | awk '
    BEGIN {
        RET = "Unknown Location"
    }

    NR == 1 {
        RET = $0
    }
    NR == 2 {
        RET = RET ", " $0
    }

    END {
        print RET
    }
'
