#!/usr/bin/env bash

set -x

SESSION="sandbox${RANDOM}"
MAINW=1

WORKING_PROJECT="$(mktemp -d)"

tmux new-session -s "$SESSION" -d -n "$MAINW" -c ~
tmux splitw -t "$SESSION:$MAINW" -d -b -h -l "$_tmux_other_pane_size" -c '#{pane_current_path}'

tmux new-window  -d -n "2" -t "$SESSION:2" -c "$WORKING_PROJECT"
tmux splitw -t "$SESSION:2" -d -b -h -l "$_tmux_other_pane_size" -c "$WORKING_PROJECT"
tmux send-keys -t "$SESSION:2.1" 'git clone  .' Left Left
tmux switch-client -t "$SESSION"