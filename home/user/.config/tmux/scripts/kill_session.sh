#!/bin/sh

if [ "${1}" = "landing" ]; then
    exit 0
fi

tmux kill-session -t "${1}"
