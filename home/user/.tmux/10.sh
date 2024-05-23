#!/usr/bin/env bash

set -x

SESSION="sandbox${RANDOM}"
MAINW=1

WORKING_PROJECT="$(mktemp -d)"

tmux new-session -s "$SESSION" -d -n "$MAINW" -c "$WORKING_PROJECT"
tmux switch-client -t "$SESSION"
tmux splitw -t "$SESSION:$MAINW" -d -b -h -l "$_tmux_new_pane_size" -c '#{pane_current_path}'