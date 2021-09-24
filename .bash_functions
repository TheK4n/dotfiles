

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

    . /opt/pythonenv/"${1}"/bin/activate
}


cl() {
    local DIR
    DIR="$*"

    if [ $# -lt 1 ]; then
        DIR=$HOME
    fi

    cd "${DIR}" && ls -F --color=auto
}
