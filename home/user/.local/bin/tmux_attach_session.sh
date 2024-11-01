#!/usr/bin/env sh


readonly tmux_list_sessions_script="$HOME/.local/bin/tmux_list_sessions.sh"

export FZF_DEFAULT_OPTS="\
--cycle \
--pointer='' \
--color='pointer:blue,prompt:blue' \
--no-multi \
--preview-window 70%,follow \
--preview 'tmux capture-pane -p -e -t {1}'
--bind \
ctrl-/:toggle-preview,\
ctrl-p:preview-up,\
ctrl-n:preview-down,\
ctrl-u:clear-query,\
ctrl-x:execute\(tmux\ kill-session\ -t\ {1}\)+reload\(${tmux_list_sessions_script}\),\
load:reload\(${tmux_list_sessions_script}\;sleep\ 1\)\
"

session_to_attach="$("${tmux_list_sessions_script}" | fzf | awk '{printf $1}')"
readonly session_to_attach

if [ -n "${session_to_attach}" ]; then
    tmux switch-client -t "${session_to_attach}"
fi