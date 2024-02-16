if [[ "$TTY" =~ /dev/tty* ]]; then
    setterm -blength=0
    setfont cyr-sun16
fi


if systemctl -q is-active graphical.target && [[ $(tty) = "/dev/tty1" ]] && [[ -z $DISPLAY ]] && [[ $XDG_VTNR -eq 1 ]]; then
    exec startx >> ~/.xlogs 2>&1
elif command -v tmux &>/dev/null && [[ $(tty) = "/dev/tty2" ]] && [[ ! "$TERM" =~ tmux ]] && [[ -z "$TMUX" ]]; then
    exec tmux new-session
fi

if [[ -n "$SSH_CLIENT" ]] && [[ ! "$TERM" =~ tmux ]] && [[ -z "$TMUX" ]]; then
    export SSH_CLIENT  # for prompt
    exec tmux new-session -s ssh -A
fi