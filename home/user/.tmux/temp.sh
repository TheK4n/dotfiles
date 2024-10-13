#!/usr/bin/env bash

set -x

readonly RND="${RANDOM}"
readonly SESSION="sandbox${RND}"


declare WORKING_PROJECT
WORKING_PROJECT="$(mktemp -td "sandbox${RND}.XXXX")"
readonly WORKING_PROJECT

tmux new-session -s "${SESSION}" -d -c "${WORKING_PROJECT}"
tmux switch-client -t "${SESSION}"