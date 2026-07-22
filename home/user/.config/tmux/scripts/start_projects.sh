#!/bin/sh


export FZF_DEFAULT_OPTS="\
${FZF_DEFAULT_OPTS}
--no-multi
--marker=''
--border=rounded
--border-label-pos=bottom
--border-label=' Start session '
--color='border:grey,label:grey'
"

project_dir="$( (
  command -v zoxide 1>/dev/null && zoxide query -l | sed "s%^${HOME}%~%"
  fd -t d -d 3 --hidden --exclude '.*' --xdev . "${HOME}" | sed "s%^${HOME}%~%"
) | fzf --no-sync | sed "s%^~%${HOME}%")"
readonly project_dir


if [ -z "${project_dir}" ]; then
    exit 0
fi

if [ ! -d "${project_dir}" ]; then
    printf 'Directory "%s" not found' "${project_dir}" >&2
    exit 1
fi

{
    if command -v zoxide 1>/dev/null 2>&1; then
        zoxide add "${project_dir}"
    fi
} &

session="$(basename "${project_dir}" | sed 's/\./_/g')"

if ! tmux has-session -t="${session}" 2>/dev/null; then
    tmux new-session -d -n 1 -c "${project_dir}" -s "${session}"
fi

tmux switch-client -t "${session}" -c "$(tmux display -p '#{client_tty}')"
