#!/usr/bin/env bash
# https://github.com/TheK4n/dotfiles

if \
  [ "$(tty)" != "/dev/tty3" ] && \
  command -v tmux &>/dev/null && \
  [ -z "$TMUX" ]              && \
  tmux -N -L "$USER" list-sessions &>/dev/null
then
    exec tmux -N -L "$USER" new-session
fi

if [ -f "$HOME/.config/bash/sourcer" ]; then
    source "$HOME/.config/bash/sourcer"
fi

if \
  command -v tmux &>/dev/null && \
  [ -n "$TMUX" ] && \
  [ -n "$SSH_CLIENT" ]
then
    tmux source-file "$XDG_CONFIG_HOME/tmux/remote.conf"
fi