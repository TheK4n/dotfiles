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


project_dir="$(find "${HOME}" -maxdepth 3 -type d -not -path '*/.*' | sed "s%^${HOME}%~%" | fzf | sed "s%^~%${HOME}%")"
readonly project_dir


if [ -z "${project_dir}" ]; then
    exit 0
fi

if [ ! -d "${project_dir}" ]; then
    printf 'Directory "%s" not found' "${project_dir}" >&2
    exit 1
fi


session="$(basename "${project_dir}" | sed 's/\./_/g')"

if ! tmux has-session -t "${session}" 2>/dev/null; then
    tmux new-session -d -n 1 -c "${project_dir}" -s "$(basename "${project_dir}")"
fi

tmux switch-client -t "${session}"
