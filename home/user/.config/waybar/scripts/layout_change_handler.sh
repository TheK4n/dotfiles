#!/bin/sh

swaymsg -m -t SUBSCRIBE "['input']" | \
jq --unbuffered -r '.change' | while read -r line; do
    if echo "${line}" | grep -q "xkb_layout"; then
        pkill -RTMIN+3 waybar
    fi
done
