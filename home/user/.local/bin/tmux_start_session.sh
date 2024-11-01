#!/usr/bin/env sh


export FZF_DEFAULT_OPTS="\
--cycle \
--pointer='' \
--color='pointer:green,prompt:green' \
--bind \
ctrl-/:toggle-preview,\
ctrl-p:preview-up,\
ctrl-n:preview-down,\
ctrl-u:clear-query\
"

readonly TMUX_SESSIONS="${HOME}/.tmux"


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

session_file="$(echo "${sessions}" | fzf +m --preview-window 70% --preview "cat '${TMUX_SESSIONS}/{1}'" | awk '{printf $1}')"
readonly session_file

if [ -n "${session_file}" ]; then
    "${TMUX_SESSIONS}/${session_file}"
fi