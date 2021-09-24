

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
alias l.='ls -aF --ignore="*" --ignore="\.\." --ignore="\."'
alias ll='ls -lhF'
alias la='ls -aF --ignore="\.\." --ignore="\."'

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


# extract tar archive in ./archive_name directory
untar() {

    if [ -z $1 ]; then
        echo "error: enter filename" >&2
        return 1  # exit code
    fi

    if ! [ -f $1 ]; then
        echo "error: file '$1' not found" >&2
        return 1  # exit code
    fi

    local dir_name
    dir_name="$(basename "${1%.*}")_untarred"

    if [ -d $dir_name ]; then
        echo "error: directory '$dir_name' exists" >&2
        return 1  # exit code
    fi

    if [ -f $dir_name ]; then
        echo "error: file '$dir_name' exists" >&2
        return 1  # exit code
    fi

    mkdir $dir_name 1>/dev/null && tar -C $dir_name -xf $1 && return 0
}


workon() {

    if [ -z $1 ]; then
        echo "error: enter filename" >&2
        return 1  # exit code
    fi

    . /opt/pythonenv/${1}/bin/activate
}
