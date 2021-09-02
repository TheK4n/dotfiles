

parse_git_branch() {
    branch="$(git branch --show-current 2> /dev/null)"

    if [[ -n "$branch" ]]; then
        echo "($branch)"
    else
        echo ''
    fi
}


virtualenv_info() {
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        echo "($(basename $VIRTUAL_ENV))"
    else
        # In case you don't have one activated
        echo ''
    fi
}

close_color='\[\e[m\]'
red_color='\[\033[1;31m\]'

prompt_color='\[\033[;32m\]'
info_color='\[\033[1;34m\]'
prompt_symbol='㉿'
end_symbol='$'


if [ "$EUID" -eq 0 ]; then  # Change prompt colors and symbols for root user
    prompt_color='\[\033[;94m\]'
    info_color='\[\033[1;31m\]'
    prompt_symbol='💀'
    end_symbol='#'
fi


if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

export VIRTUAL_ENV_DISABLE_PROMPT=1
VENV="\$(virtualenv_info)";

BRANCH="\$(parse_git_branch)";

# last
PS1="\n$prompt_color┌─${VENV}─($close_color$info_color\u$prompt_symbol\H$close_color$prompt_color)-[$close_color\w$prompt_color]$close_color $red_color${BRANCH}$close_color\n$prompt_color└─$close_color$info_color$end_symbol$close_color "
