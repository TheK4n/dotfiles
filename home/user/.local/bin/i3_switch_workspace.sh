#!/bin/bash

function gen_workspaces()
{
    i3-msg -t get_workspaces | tr ',' '\n' | grep "name" | sed 's/"name":"\(.*\)"/\1/g'
}


WORKSPACE=$(gen_workspaces | rofi -dmenu -i -p "Select workspace")

if [ -n "${WORKSPACE}" ]
then
    i3-msg workspace "${WORKSPACE}"
fi
