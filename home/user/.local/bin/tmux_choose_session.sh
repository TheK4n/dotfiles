#!/usr/bin/env bash


export FZF_DEFAULT_OPTS="\
--cycle \
--pointer='' \
--marker='+' \
--color='pointer:green' \
--bind \
ctrl-/:toggle-preview,\
ctrl-a:toggle-all,\
ctrl-p:preview-up,\
ctrl-n:preview-down,\
ctrl-u:clear-query,\
ctrl-q:toggle+down,\
tab:replace-query,\
shift-tab:toggle\
"

declare sessions
sessions="$(tmux list-session -F '#S')"
readonly sessions


declare session
session="$(echo "${sessions}" | fzf +m --preview-window 75%,follow --preview 'tmux capture-pane -p -e -t {1}')"
readonly session

if [[ -n "${session}" ]]; then
    tmux switch-client -t "${session}"
fi
