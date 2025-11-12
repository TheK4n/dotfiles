#!/bin/bash


set -eu


current_monitor=$(swaymsg -r -t get_workspaces | jq '.[] | select(.focused).output' | tr -d '"')
other_monitor=$(swaymsg -r -t get_outputs | jq -r ".[] | select(.active and .name != \"${current_monitor}\").name" | head -n 1)

if [ -z "${other_monitor}" ]; then
    echo "No other active monitor found."
    exit 1
fi

current_workspace=$(swaymsg -r -t get_workspaces | jq '.[] | select(.focused).name' | tr -d '"')
other_workspace=$(swaymsg -r -t get_workspaces | jq -r ".[] | select(.visible and .output == \"${other_monitor}\").name" | head -n 1)

if [ -n "${other_workspace}" ]; then
    # Swap workspaces
    swaymsg "workspace ${other_workspace}; move workspace to output ${current_monitor}"
    swaymsg "workspace ${current_workspace}; move workspace to output ${other_monitor}"
    swaymsg "workspace ${other_workspace}"
else
    # Just move current workspace if target is empty
    swaymsg "move workspace to output ${other_monitor}"
fi
