#!/usr/bin/env bash

set -x

SESSION=dotfiles
MAINW=1

WORKING_PROJECT="$HOME/dotfiles"

if ! tmux has-session -t "$SESSION"; then
    tmux new-session -s "$SESSION" -d -n "$MAINW" -c "$WORKING_PROJECT"
    tmux splitw -t "$SESSION:$MAINW" -d -b -h -l "$_tmux_other_pane_size" -c '#{pane_current_path}'
    tmux send-keys -t "$SESSION:$MAINW.1" "git pull" Enter
    tmux send-keys -t "$SESSION:$MAINW.2" '$EDITOR' Enter
    tmux send-keys -t "$SESSION:$MAINW.2" ':Telescope find_files' Enter
fi

tmux switch-client -t "$SESSION"