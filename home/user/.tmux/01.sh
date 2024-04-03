#!/usr/bin/env bash

set -x

SESSION=s01
MAINW=1

WORKING_PROJECT="$HOME/code/shell/note"
EDITOR="vi"

if ! tmux has-session -t "$SESSION"; then
    tmux new-session -s "$SESSION" -d -n "$MAINW" -c "$WORKING_PROJECT"
    tmux send-keys -t "$SESSION:$MAINW" "$EDITOR" Enter
    tmux splitw -t "$SESSION:$MAINW" -d -h -l 40% -c '#{pane_current_path}'
fi

tmux switch-client -t "$SESSION"