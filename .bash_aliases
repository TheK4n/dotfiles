
# colors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

        alias dir='dir --color=auto'
        alias vdir='vdir --color=auto'
        alias grep='grep --color=auto'
        alias egrep='egrep --color=auto'
        alias fgrep='fgrep --color=auto'

        # navigate
        alias ls='ls --color=auto'
        alias l.='ls -dh .* --color=auto'
        alias ll='ls -lh --color=auto'
        alias la='ls -a --color=auto'
else
    alias l.='ls -dh .*'
    alias ll='ls -lh'
    alias la='ls -a'
fi


alias mkdir='mkdir -pv'

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'

alias path='echo -e ${PATH//:/\\n}'


# shorts
alias c='clear'
alias q='exit'
alias h='history'
alias j='jobs -l'


# utils
alias diff='colordiff'
alias mount='mount | column -t'
alias start_bt='sudo systemctl start bluetooth'
alias upgrade_all='sudo apt update && sudo apt upgrade'
alias tar-it='tar -czf "../${PWD##*/}.tar.gz" .'


# time
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'

# vim
alias vi=vim
alias svim='sudo vim'
alias vis='vim "+set si"'

# net
alias ports='netstat -tulanp'
