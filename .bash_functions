

# extract tar archive in ./archive_name directory
untar() {

    if [ -z "$1" ]; then
        echo "error: enter filename" >&2
        return 1  # exit code
    fi

    if ! [ -f "$1" ]; then
        echo "error: file '$1' not found" >&2
        return 1  # exit code
    fi

    local dir_name
    dir_name="$(basename "${1%.*}")_untarred"

    if [ -d "$dir_name" ]; then
        echo "error: directory '$dir_name' exists" >&2
        return 1  # exit code
    fi

    if [ -f "$dir_name" ]; then
        echo "error: file '$dir_name' exists" >&2
        return 1  # exit code
    fi

    mkdir "$dir_name" 1>/dev/null && tar -C "$dir_name" -xf "$1" && return 0
}


workon() {

    if [ -z "$1" ]; then
        echo "error: enter filename" >&2
        return 1  # exit code
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
        echo "error: virtual environment not found, use python3 -m virtualenv venv" >&2
        return 1
    fi
}


extract () {
    if [ -z "$1" ]; then  # if string non-zero
        # display usage if no parameters given
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
        return 100
    else
        if [ -f "$1" ]; then   # if file exists
            NAME=${1%.*}

            if [ -e "$NAME" ]; then
                echo "$NAME - exists" >&2
                return 1
            fi

            mkdir "$NAME" && cd "$NAME" || return 1

            case $1 in
                *.tar.bz2)  tar xvjf     ../"$1" ;;
                *.tar.gz)   tar xvzf     ../"$1" ;;
                *.tar.xz)   tar xvJf     ../"$1" ;;
                *.lzma)     unlzma       ../"$1" ;;
                *.bz2)      bunzip2      ../"$1" ;;
                *.rar)      unrar x -ad  ../"$1" ;;
                *.gz)       gunzip       ../"$1" ;;
                *.tar)      tar xvf      ../"$1" ;;
                *.tbz2)     tar xvjf     ../"$1" ;;
                *.tgz)      tar xvzf     ../"$1" ;;
                *.zip)      unzip        ../"$1" ;;
                *.Z)        uncompress   ../"$1" ;;
                *.7z)       7z x         ../"$1" ;;
                *.xz)       unxz         ../"$1" ;;
                *.exe)      cabextract   ../"$1" ;;
                *)          echo "extract: '$1' - unknown archive method" >&2;;
            esac
            cd ..
        else
            echo "$1 - file does not exist" >&2
            return 1
        fi
    fi
}


mcd () {
  mkdir -p "$1" && cd "$1" || return
}
