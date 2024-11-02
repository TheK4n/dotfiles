#!/bin/sh

gen_workspaces()
{
    i3-msg -t get_workspaces | tr ',' '\n' | grep "name" | sed 's/"name":"\(.*\)"/\1/g'
}

choosed_workspace=$(gen_workspaces | rofi -dmenu -m -1 -i -p "Select workspace")

if [ -n "${choosed_workspace}" ]
then
    i3-msg workspace "${choosed_workspace}"
fi