
# vim: ft=zsh

umask 022

export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

for TMPDIR in "${TMPDIR}" "${TMP}" /tmp /var/tmp
do
    test -d "${TMPDIR}" && break
done
export TMPDIR


export EDITOR="nvim"
export VISUAL="${EDITOR}"

export PAGER="less"
export LESS="-nMWiSRx4 --mouse -j2 -# 1 -+X -+F"
if command -v "lesspipe.sh" &>/dev/null; then
    export LESSOPEN="| lesspipe.sh %s"
fi
export LESSCHARSET=utf-8

export LC_TIME="ru_RU.UTF-8"


export FZF_DEFAULT_OPTS="\
--cycle
--color='gutter:-1,pointer:red,preview-border:grey,separator:grey'
--pointer='> '
--marker='* '
--preview-window=70%
--bind
ctrl-/:toggle-preview,\
ctrl-a:toggle-all,\
ctrl-p:preview-up,\
ctrl-n:preview-down,\
ctrl-u:clear-query,\
ctrl-o:toggle,\
ctrl-y:preview-top,\
ctrl-g:preview-bottom,\
tab:replace-query\
"

export BROWSERCLI=w3m
test -z "${BROWSER}" && BROWSER=firefox
export BROWSER

if [ -d "${HOME}/.local/bin" ] ; then
    export PATH="${HOME}/.local/bin:${PATH}"
fi

export GOCACHE="${TMPDIR}/go-cache-$(id -u)"
export PPROF_TMPDIR="${TMPDIR}/go-pprof-$(id -u)"
export GOPATH="${HOME}/.cache/go"
export GOBIN="${HOME}/.local/bin"


export XDG_DESKTOP_DIR="${HOME}/Desktop"
export XDG_DOCUMENTS_DIR="${HOME}/Documents"
export XDG_DOWNLOAD_DIR="${HOME}/Downloads"
export XDG_MUSIC_DIR="${HOME}/Music"
export XDG_PICTURES_DIR="${HOME}/Pictures"
export XDG_PUBLICSHARE_DIR="${HOME}/Public"
export XDG_TEMPLATES_DIR="${HOME}/Templates"
export XDG_VIDEOS_DIR="${HOME}/Videos"

export SCREENSHOTS_DIR="${XDG_PICTURES_DIR}/screenshots"

export OSTYPE


_sod() {
    local -r dir_to_source="${1}"

    if [ -d "${dir_to_source}" ] && [ -n "$(ls "${dir_to_source}")" ]; then
        local filename
        for filename in $(ls "${dir_to_source}" | sort -n)
        do
            # shellcheck disable=SC1090
            source "${dir_to_source}/${filename}"
        done
    fi
}

_sod "${HOME}/.zshenv.d"
