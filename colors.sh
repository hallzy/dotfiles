#!/usr/bin/env bash

# This just spits out the colours of 256 colours so that I can see what they are
colors() {
  for i in {0..255} ; do
      printf "\x1b[38;5;${i}mcolour${i}\n"
  done
}

colors | more
