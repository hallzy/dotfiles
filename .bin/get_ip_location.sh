#!/bin/bash

curl ipinfo.io 2> /dev/null | jq -r '.city, .country' | awk '
    NR == 1 {
        CITY = $0
    }
    NR == 2 {
        COUNTRY = $0
    }
    END {
        print CITY ", " COUNTRY
    }
'
