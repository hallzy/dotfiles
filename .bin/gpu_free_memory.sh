#!/bin/bash

nvidia-smi --query | awk '
    BEGIN {
        SEEN = 0;
    }

    /FB Memory Usage/ {
        SEEN = 1;
        next;
    }

    SEEN == 1 && /Free/ {
        print $3 " " $4;
        exit;
    }
'
