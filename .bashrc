# .bashrc by TheK4n

if [ -f $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

if [ -f $HOME/.bash_functions ]; then
    source $HOME/.bash_functions
fi

if [ -f /etc/bash_completion.d/all ]; then
    source /etc/bash_completion.d/all
fi


if type shopt 2>/dev/null 1>&2; then

    # corrections
    shopt -s cdspell
    shopt -s dirspell

    shopt -s histappend
fi

export HISTSIZE=10000
export HISTIGNORE="&:l[lsa\.]:[bf]g:exit:q:clear:c:history:h"



parse_git_branch() {

    if ! [ -x "$(which git)" ]; then
        return
    fi

    local branch status

    # current branch
    branch="$(git branch --show-current 2> /dev/null)"

    # current status
    # M = modified
    # A = added
    # D = deleted
    # R = renamed
    # C = copied
    # U = updated but unmerged

    status="$(git status -s 2>/dev/null | cut -c 1 | sort -u | tr -d " \n?")"

    if [ -n "$status" ]; then
        status="-[$status]"
    fi

    if [[ -n "$branch" ]]; then
        echo "($branch)$status"
    fi
}


virtualenv_info() {

    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        echo "($(basename $VIRTUAL_ENV))"
    fi
}

rightprompt()
{
    if [[ $1 -ne 0 ]]; then
        printf "%*s" $COLUMNS "$1 ⨯"
    fi
}


PROMPT_COMMAND=__prompt_command

__prompt_command() {

    local EXIT="$?"

    close_color='\[\e[m\]'
    red_color='\[\033[1;31m\]'

    prompt_color='\[\033[;32m\]'
    info_color='\[\033[1;34m\]'
    prompt_symbol='㉿'
    end_symbol='$'


    if [ "$EUID" -eq 0 ]; then  # Change prompt colors and symbols for root user
        prompt_color='\[\033[;94m\]'
        info_color='\[\033[1;31m\]'
        end_symbol='#'
    fi


    if [[ -n "$SSH_CLIENT" || -n "$SSH2_CLIENT" ]]; then
        prompt_symbol='📡'
    fi


    export VIRTUAL_ENV_DISABLE_PROMPT=1

    VENV_="\$(virtualenv_info)"
    BRANCH_="\$(parse_git_branch)"
    TERMINAL_NAME="\[\e]2;${0^^}\a\]"

    if [ $EXIT != 0 ]; then
        PS1="$TERMINAL_NAME\n$prompt_color┌─${VENV_}─($close_color$info_color\u$prompt_symbol\H$close_color$prompt_color)-[$close_color\w$prompt_color]$close_color $red_color${BRANCH_}$close_color\n\[$(tput sc; rightprompt $EXIT; tput rc)\]$prompt_color└─$close_color$info_color$end_symbol$close_color "
    else
        PS1="$TERMINAL_NAME\n$prompt_color┌─${VENV_}─($close_color$info_color\u$prompt_symbol\H$close_color$prompt_color)-[$close_color\w$prompt_color]$close_color $red_color${BRANCH_}$close_color\n$prompt_color└─$close_color$info_color$end_symbol$close_color "
    fi

    PS2="> "
}


