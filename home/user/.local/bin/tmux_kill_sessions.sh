#!/usr/bin/env sh


readonly tmux_list_sessions_script="$HOME/.local/bin/tmux_list_sessions.sh"

export FZF_DEFAULT_OPTS="\
--cycle \
--pointer='' \
--marker='+' \
--color='pointer:red,prompt:red' \
--multi \
--preview-window 70%,follow \
--preview 'tmux capture-pane -p -e -t {1}' \
--bind \
ctrl-/:toggle-preview,\
ctrl-a:toggle-all,\
ctrl-p:preview-up,\
ctrl-n:preview-down,\
ctrl-u:clear-query,\
ctrl-o:toggle,\
ctrl-x:execute\(tmux\ kill-session\ -t\ {1}\)+reload\(${tmux_list_sessions_script}\)\
"

sessions_to_kill="$(~/.local/bin/tmux_list_sessions.sh | fzf | awk '{printf $1"\n"}')"
readonly sessions_to_kill

if [ -n "${sessions_to_kill}" ]; then
    echo "${sessions_to_kill}" | xargs -n 1 tmux kill-session -t
fi