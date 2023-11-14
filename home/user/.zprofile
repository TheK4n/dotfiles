if [[ "$TTY" =~ /dev/tty* ]]; then
    setterm -blength=0
fi

if systemctl -q is-active graphical.target && [[ $(tty) = "/dev/tty1" ]] && [[ -z $DISPLAY ]] && [[ $XDG_VTNR -eq 1 ]]; then
    exec startx >> ~/.xlogs 2>&1
fi
