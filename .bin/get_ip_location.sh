#!/bin/bash

curl ipinfo.io 2> /dev/null | jq -r '.city, .country' | awk '
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
