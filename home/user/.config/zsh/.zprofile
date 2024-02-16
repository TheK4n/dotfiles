if [[ "$TTY" =~ /dev/tty* ]]; then
    setterm -blength=0
    setfont cyr-sun16
fi

if [[ "$TTY" = "/dev/tty1" ]] && [[ $XDG_VTNR -eq 1 ]] && [[ -z $DISPLAY ]] && systemctl -q is-active graphical.target; then
    exec startx >> ~/.xlogs 2>&1
elif [[ "$TTY" = "/dev/tty2" ]] && command -v tmux &>/dev/null && [[ ! "$TERM" =~ tmux ]] && [[ -z "$TMUX" ]]; then
    exec tmux new-session -s "$(basename $TTY)" -A
fi

if [[ -n "$SSH_CLIENT" ]] && [[ ! "$TERM" =~ tmux ]] && [[ -z "$TMUX" ]]; then
    export SSH_CLIENT
    exec tmux new-session -s ssh -A
fi