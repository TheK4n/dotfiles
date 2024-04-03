#!/usr/bin/env bash
# https://github.com/TheK4n/dotfiles

if \
  [ "$(tty)" != "/dev/tty3" ] && \
  [ -z "$TMUX" ]              && \
  [[ ! "$TERM" =~ tmux ]]     && \
  command -v tmux &>/dev/null
then
    exec tmux
fi

if [ -f "$HOME/.config/bash/sourcer" ]; then
    source "$HOME/.config/bash/sourcer"
fi