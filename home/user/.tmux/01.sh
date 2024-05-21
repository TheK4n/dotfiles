#!/usr/bin/env bash

set -x

SESSION=dotfiles
MAINW=1

WORKING_PROJECT="$HOME/dotfiles"

if ! tmux has-session -t "$SESSION"; then
    tmux new-session -s "$SESSION" -d -n "$MAINW" -c "$WORKING_PROJECT"
    tmux send-keys -t "$SESSION:$MAINW" '$EDITOR' Enter
    tmux send-keys -t "$SESSION:$MAINW" , f f
    tmux splitw -t "$SESSION:$MAINW" -d -b -h -l 30% -c '#{pane_current_path}'
fi

tmux switch-client -t "$SESSION"