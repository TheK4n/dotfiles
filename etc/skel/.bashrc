alias l.='ls -AF --ignore="*"'
alias ll='ls -lhF'
alias la='ls -AF'

alias lt='du -sh * | sort -h'

alias rm='rm -ir'
alias mkdir='mkdir -pv'

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'

alias path='echo -e ${PATH//:/\\n}'

# shorts
alias c='clear'
alias q='exit'
alias h='history | less'
alias j='jobs -l'

# utils
alias tar-it='tar -czf "../${PWD##*/}.tar.gz" .'

PS1="\n┌──(\u@\H)-[\w]\n└─\$ "