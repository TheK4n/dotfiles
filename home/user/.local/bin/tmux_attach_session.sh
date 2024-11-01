#!/usr/bin/env sh


export FZF_DEFAULT_OPTS="\
--cycle \
--pointer='' \
--color='pointer:blue,prompt:blue' \
--bind \
ctrl-/:toggle-preview,\
ctrl-p:preview-up,\
ctrl-n:preview-down,\
ctrl-x:execute\(tmux\ kill-session\ -t\ {1}\)+reload\(~/.local/bin/tmux_list_sessions.sh\),\
ctrl-u:clear-query\
"

session_to_attach="$(~/.local/bin/tmux_list_sessions.sh | fzf +m --preview-window 70%,follow --preview 'tmux capture-pane -p -e -t {1}' | awk '{printf $1}')"
readonly session_to_attach

if [ -n "${session_to_attach}" ]; then
    tmux switch-client -t "${session_to_attach}"
fi