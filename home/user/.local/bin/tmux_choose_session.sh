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

declare current_session
current_session="$(tmux display-message -p '#S')"
readonly current_session

declare sessions
sessions="$(tmux list-session -F '#S#{?session_attached, (attached),}')"
sessions="$(echo "${sessions}" | sed "s/^${current_session} /${current_session} (current) /")"
readonly sessions


declare session
session="$(echo "${sessions}" | fzf +m --preview-window 75%,follow --preview 'tmux capture-pane -p -e -t {1}' | awk '{printf $1}')"
readonly session

if [[ -n "${session}" ]]; then
    tmux switch-client -t "${session}"
fi
