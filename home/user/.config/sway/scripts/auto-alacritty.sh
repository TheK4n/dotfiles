#!/bin/sh

while true; do
    alacritty --class "${1:-Alacritty}"
    sleep 1
done
