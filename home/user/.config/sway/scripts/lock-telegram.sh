#!/bin/bash

TELEGRAM_WINDOW="$(
    swaymsg -t get_tree | \
    jq -r '.. | select(.app_id? == "org.telegram.desktop") | .id' | \
    head -n 1
)"

readonly TELEGRAM_WINDOW


if [ -z "${TELEGRAM_WINDOW}" ]; then
    echo "Error: Telegram not found"
    exit 0
fi

swaymsg "[con_id=${TELEGRAM_WINDOW}] focus"

sleep 0.2

wtype -M ctrl l

swaymsg workspace back_and_forth

exit 0
