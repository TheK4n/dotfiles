#!/usr/bin/env bash
# https://github.com/TheK4n/dotfiles

if \
  [ "$(tty)" != "/dev/tty3" ] && \
  [ -z "$TMUX" ]              && \
  [[ ! "$TERM" =~ tmux ]]     && \
  command -v tmux &>/dev/null
then
    if tmux -N -L "$USER" list-sessions &>/dev/null; then
        if [ -n "$SSH_CLIENT" ]; then
            exec tmux -N -L "$USER" new-session
        else
            exec tmux -N -L "$USER" new-session -A
        fi
    else
        if [ -n "$SSH_CLIENT" ]; then
            exec tmux new-session
        else
            exec tmux new-session -A
        fi
    fi
fi

if [ -f "$HOME/.config/bash/sourcer" ]; then
    source "$HOME/.config/bash/sourcer"
fi