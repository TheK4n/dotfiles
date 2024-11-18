#!/bin/sh


readonly tmux_list_sessions_script="${HOME}/.local/bin/tmux_list_sessions.sh"

export FZF_DEFAULT_OPTS="\
${FZF_DEFAULT_OPTS}
--multi
--border=rounded
--border-label-pos=bottom
--border-label=' Kill sessions '
--color='border:red,label:red'
--preview-window=follow
--preview='tmux capture-pane -p -e -t {1}'
--bind
ctrl-x:execute\(tmux\ kill-session\ -t\ {1}\)+reload\(${tmux_list_sessions_script}\)\
"

sessions_to_kill="$(~/.local/bin/tmux_list_sessions.sh | fzf | awk '{printf $1"\n"}')"
readonly sessions_to_kill

if [ -n "${sessions_to_kill}" ]; then
    echo "${sessions_to_kill}" | xargs -n 1 tmux kill-session -t
fi