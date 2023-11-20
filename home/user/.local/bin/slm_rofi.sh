#!/bin/bash

choosed_screen_layout="$(slm ls | rofi -dmenu -i -p "Select screen layout")"
slm load "$choosed_screen_layout"
