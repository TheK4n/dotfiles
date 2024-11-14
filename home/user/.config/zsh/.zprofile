export XDG_RUNTIME_DIR="/run/user/$(id -u)"

if [[ "$TTY" =~ /dev/tty* ]]; then
    setterm -blength=0
    setfont cyr-sun16
fi

if [[ "$TTY" = "/dev/tty1" ]] && [[ $XDG_VTNR -eq 1 ]] && [[ -z $DISPLAY ]] && systemctl -q is-active graphical.target; then
    exec startx >> ~/.xlogs 2>&1
fi