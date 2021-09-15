
# colors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

        alias dir='dir --color=auto'
        alias vdir='vdir --color=auto'
        alias grep='grep --color=auto'
        alias egrep='egrep --color=auto'
        alias fgrep='fgrep --color=auto'

        # navigate
        alias ls='ls -F --color=auto'
        alias l.='ls -dhF .* --color=auto'
        alias ll='ls -lhF --color=auto'
        alias la='ls -aF --color=auto'
else
    alias ls='ls -F'
    alias l.='ls -dhF .*'
    alias ll='ls -lhF'
    alias la='ls -aF'
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
