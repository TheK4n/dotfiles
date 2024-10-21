#!/usr/bin/env bash


export FZF_DEFAULT_OPTS="\
--cycle \
--pointer='' \
--marker='+' \
--color='pointer:green' \
--bind \
ctrl-/:toggle-preview,\
ctrl-p:preview-up,\
ctrl-n:preview-down,\
ctrl-u:clear-query,\
ctrl-q:toggle+down\
"

declare -r TMUX_SESSIONS="${HOME}/.tmux"

declare sessions
sessions="$(find "${TMUX_SESSIONS}/" -type f -executable)"
readonly sessions

declare session_file
session_file="$(echo "${sessions}" | xargs -n 1 basename | fzf +m --preview-window 70% --preview "cat '${TMUX_SESSIONS}/{1}'")"
readonly session_file

if [[ -n "${session_file}" ]]; then
    "${TMUX_SESSIONS}/${session_file}"
fi