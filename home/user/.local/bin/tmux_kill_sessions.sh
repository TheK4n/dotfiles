#!/usr/bin/env sh


export FZF_DEFAULT_OPTS="\
--cycle \
--pointer='' \
--marker='+' \
--color='pointer:red,prompt:red' \
--bind \
ctrl-/:toggle-preview,\
ctrl-p:preview-up,\
ctrl-n:preview-down,\
ctrl-x:execute\(tmux\ kill-session\ -t\ {1}\)+reload\(~/.local/bin/tmux_list_sessions.sh\),\
ctrl-u:clear-query,\
ctrl-o:toggle\
"

sessions_to_kill="$(~/.local/bin/tmux_list_sessions.sh | fzf -m --preview-window 70%,follow --preview 'tmux capture-pane -p -e -t {1}' | awk '{printf $1"\n"}')"
readonly sessions_to_kill

if [ -n "${sessions_to_kill}" ]; then
    echo "${sessions_to_kill}" | xargs -n 1 tmux kill-session -t
fi