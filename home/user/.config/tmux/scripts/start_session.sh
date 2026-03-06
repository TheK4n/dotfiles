#!/bin/sh


readonly TMUX_SESSIONS="${HOME}/.tmux"
readonly EDITOR="nvim"

export FZF_DEFAULT_OPTS="\
${FZF_DEFAULT_OPTS}
--no-multi
--marker=''
--border=rounded
--border-label-pos=bottom
--border-label=' Start session '
--color='border:green,label:green'
--preview='highlight -O ansi '${TMUX_SESSIONS}/{1}''
--bind
ctrl-e:execute\(${EDITOR}\ \"${TMUX_SESSIONS}/{1}\"\)\
"


current_session="$(tmux display-message -p '#S')"
readonly current_session

existing_sessions="$(tmux list-session -F '#S')"
readonly existing_sessions

sessions="$(find "${TMUX_SESSIONS}/" -type f -executable -exec basename {} \;)"
sessions="$(echo "${sessions}" | sed "s/^${current_session}/${current_session} (current)/")"

for _s in $existing_sessions
do
    sessions="$(echo "${sessions}" | sed "s/^${_s}/${_s} (created)/")"
done
readonly sessions

session_file="$(echo "${sessions}" | fzf | awk '{printf $1}')"
readonly session_file

if [ -n "${session_file}" ]; then
    "${TMUX_SESSIONS}/${session_file}"
fi