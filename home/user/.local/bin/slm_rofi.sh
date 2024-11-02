#!/bin/sh

choosed_screen_layout="$(slm ls | rofi -dmenu -m -1 -i -p "Select screen layout")"
slm load "$choosed_screen_layout"