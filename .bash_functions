

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

# classic archive extractor
extract () {
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2) tar xvjf "$1"   ;;
            *.tar.gz)  tar xvzf "$1"   ;;
            *.bz2)     bunzip2 "$1"    ;;
            *.rar)     unrar x "$1"    ;;
            *.gz)      gunzip "$1"     ;;
            *.tar)     tar xvf "$1"    ;;
            *.tbz2)    tar xvjf "$1"   ;;
            *.tgz)     tar xvzf "$1"   ;;
            *.zip)     unzip "$1"      ;;
            *.Z)       uncompress "$1" ;;
            *.7z)      7z x "$1"       ;;
            *)         echo "'$1' cannot be extracted via $0" >&2; return 1;;
        esac
    else
        echo "'$1' is not a valid file" >&2
        return 1
    fi
}
