
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
alias sha='shasum -a 256'
alias getpass="openssl rand -base64 12"
alias diff='colordiff'
alias mount='mount | column -t'
alias start_bt='sudo systemctl start bluetooth'
alias upgrade_all='sudo apt update && sudo apt upgrade'
alias tar-it='tar -czf "../${PWD##*/}.tar.gz" .'

# extract tar archive in ./archive_name directory
untar() {

    if ! [ -f $1 ]; then
        echo "\033[0;31merror: file '$1' not found\e[m" >&2
        return 1  # exit code
    fi

    dir_name="$(basename $1 | cut -d. -f1)"

    if [ -d $dir_name ]; then
        echo "\033[0;31merror: directory '$dir_name' exists\e[m" >&2
        return 1  # exit code
    fi

    if [ -f $dir_name ]; then
        echo "\033[0;31merror: file '$dir_name' exists\e[m" >&2
        return 1  # exit code
    fi

    mkdir $dir_name 1>/dev/null
    tar -C $dir_name -xf $1 && return 0
}



# time
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'

# vim
alias vi=vim
alias svim='sudo vim'
alias vis='vim "+set si"'

# net
alias ports='netstat -tulanp'
alias wget='wget -c'
alias ping='ping -c 5'

# starts web server
alias www='python3 -m http.server 8000'

alias myip='curl ipinfo.io/ip'
