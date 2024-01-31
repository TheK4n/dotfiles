#!/bin/bash

choosed_screen_layout="$(slm ls | rofi -dmenu -m -4 -i -p "Select screen layout")"
slm load "$choosed_screen_layout"