#!/bin/bash

# Grab clipboard contents
CLIP=$(xclip -o)

# Run in new st terminal and keep it open
st -e bash -c "echo \"$CLIP\"; echo ''; qrencode -t ANSIUTF8 \"$CLIP\"; echo ''; echo 'Press Enter to close...'; read"
