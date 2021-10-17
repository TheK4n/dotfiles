

workon() {

    if [ -z "$1" ]; then
        echo "workon: error: enter filename" >&2
        return 2  # exit code
    fi

    source /opt/pythonenv/"${1}"/bin/activate
}


cl() {
    local DIR
    DIR="$*"

    if [ $# -lt 1 ]; then
        DIR="$HOME"
    fi

    cd "${DIR}" && ls -F --color=auto
}


va() {
    local activate_venv

    if [ -f "./venv/bin/activate" ]; then
        source "./venv/bin/activate"
        return 0
    fi

    activate_venv="$(find -P . -maxdepth 3 -type f -name activate | sort | head -n 1)"

    if [ -n "$activate_venv" ]; then
        source "$activate_venv"
        return 0
    else
        echo "va: error: virtual environment not found, use python3 -m virtualenv venv" >&2
        return 1
    fi
}


extract () {
    if [ -z "$1" ]; then  # if string non-zero
        # display usage if no parameters given
        echo "extract: error: usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
        return 2
    fi

    if ! [ -f "$1" ]; then   # if file not exist
        echo "extract: error: '$1' file does not exist" >&2
        return 1
    fi

    local NAME
    NAME=${1%%.*}  # removes extension from filename


    if [ -e "$NAME" ]; then
        echo "extract: error: '$NAME' exists" >&2
        return 1
    fi

    mkdir "$NAME" && cd "$NAME" || return 1

    case $1 in
        *.tar.bz2)  tar xjf      ../"$1" ;;
        *.tar.gz)   tar xzf      ../"$1" ;;
        *.tar.xz)   tar xJf      ../"$1" ;;
        *.lzma)     unlzma       ../"$1" ;;
        *.bz2)      bunzip2      ../"$1" ;;
        *.rar)      unrar x -ad  ../"$1" ;;
        *.gz)       gunzip       ../"$1" ;;
        *.tar)      tar xf       ../"$1" ;;
        *.tbz2)     tar xjf      ../"$1" ;;
        *.tgz)      tar xzf      ../"$1" ;;
        *.zip)      unzip        ../"$1" ;;
        *.Z)        uncompress   ../"$1" ;;
        *.7z)       7z x         ../"$1" ;;
        *.xz)       unxz         ../"$1" ;;
        *.exe)      cabextract   ../"$1" ;;
        *)          echo "extract: error: '$1' - unknown archive method" >&2 ;;
    esac
    cd ..
}


mcd () {
    mkdir -p "$1" && cd "$1" || return
}
