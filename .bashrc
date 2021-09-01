

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}


virtualenv_info() {
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="$(basename $VIRTUAL_ENV)"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "($venv)"
}

close_color='\[\e[m\]'
prompt_color='\[\033[;32m\]'
info_color='\[\033[1;34m\]'
prompt_symbol='㉿'
end_symbol='$'
red_color='\[\033[1;31m\]'

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

# last
PS1="\n$prompt_color┌─${VENV}─($close_color$info_color\u$prompt_symbol\H$close_color$prompt_color)-[$close_color\w$prompt_color]$close_color $red_color\$(parse_git_branch)$close_color\n$prompt_color└─$close_color$info_color$end_symbol$close_color "
