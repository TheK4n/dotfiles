#!/usr/bin/env bash

set -x

SESSION="sandbox${RANDOM}"
MAINW=1

WORKING_PROJECT="$(mktemp -d)"

tmux new-session -s "$SESSION" -d -n "$MAINW" -c "$WORKING_PROJECT"
tmux switch-client -t "$SESSION"