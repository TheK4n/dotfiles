

# colors
if [ -x "$(which dircolors)" ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'

    alias ls='ls --color=auto'
fi

# these aliases use the "ls" alias, which was defined earlier
alias l.='ls -AF --ignore="*"'
alias ll='ls -lhF'
alias la='ls -AF'

alias mkdir='mkdir -pv'

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'

alias path='echo -e ${PATH//:/\\n}'


# shorts
alias c='clear'
alias q='exit'
alias h='history'
alias j='jobs -l'


# utils
alias sha='shasum -a 256'
alias getpass="openssl rand -base64 12"
alias diff='colordiff'
alias mount='mount | column -t'
alias start_bt='sudo systemctl start bluetooth'
alias upgrade_all='sudo apt update && sudo apt upgrade'
alias tar-it='tar -czf "../${PWD##*/}.tar.gz" .'
alias gh='history|grep'

# time
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'

# vim
alias vi=vim
alias svim='sudo vim'
alias vis='vim "+set si"'
alias edit=vim

# net
alias ports='netstat -tulanp'
alias wget='wget -c'
alias ping='ping -c 5'
alias myip='curl ipinfo.io/ip'

# starts web server
alias www='python3 -m http.server 8000'

# hard
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

alias meminfo='free -mlth'
alias psmem='ps auxf | sort -nr -k 4 | less -R'


alias music='mplayer -shuffle ~/Music/*'


# python
alias ve='python3 -m virtualenv venv'
alias va='. venv/bin/activate'
alias vd='deactivate'



