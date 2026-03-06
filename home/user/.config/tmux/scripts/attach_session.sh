#!/bin/sh


readonly tmux_list_sessions_script="${HOME}/.config/tmux/scripts/list_sessions.sh"
readonly tmux_kill_session_script="${HOME}/.config/tmux/scripts/kill_session.sh"

export FZF_DEFAULT_OPTS="\
${FZF_DEFAULT_OPTS}
--no-multi
--marker=''
--border=rounded
--border-label-pos=bottom
--border-label=' Attach session '
--color='border:blue,label:blue'
--preview-window=follow
--preview='tmux capture-pane -p -e -t {1}'
--bind
ctrl-x:execute\(${tmux_kill_session_script}\ {1}\)+reload\(${tmux_list_sessions_script}\),\
load:reload\(${tmux_list_sessions_script}\;sleep\ 1\)\
"

session_to_attach="$("${tmux_list_sessions_script}" | fzf | awk '{printf $1}')"
readonly session_to_attach

if [ -n "${session_to_attach}" ]; then
    tmux switch-client -t "${session_to_attach}"
fi
