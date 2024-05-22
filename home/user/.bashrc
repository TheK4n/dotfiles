#!/usr/bin/env bash
# https://github.com/TheK4n/dotfiles

if \
  [ "$(tty)" != "/dev/tty3" ] && \
  [ -z "$TMUX" ]              && \
  command -v tmux &>/dev/null && \
  tmux -N -L "$USER" list-sessions &>/dev/null
then
    exec tmux -N -L "$USER" new-session
fi

if [ -f "$HOME/.config/bash/sourcer" ]; then
    source "$HOME/.config/bash/sourcer"
fi