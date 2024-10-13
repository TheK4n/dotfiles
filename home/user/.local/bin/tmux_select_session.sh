#!/usr/bin/env bash


readonly TMUX_SESSIONS="${HOME}/.tmux"

declare sessions
sessions="$(find "${TMUX_SESSIONS}/" -type f -executable)"
readonly sessions

declare session_file
session_file="$(echo "${sessions}" | xargs -n 1 basename | fzf +m)"
readonly session_file

if [[ -n "${session_file}" ]]; then
    "${TMUX_SESSIONS}/${session_file}"
fi