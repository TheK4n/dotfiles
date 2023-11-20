#!/bin/bash


eval "$(echo "i3-msg exit
reboot
shutdown -h now
systemctl suspend
i3lock -enf -c 1e1e1e
convert canvas:none PNG:- | feh -YF -" | rofi -dmenu -i -p "Power")"


