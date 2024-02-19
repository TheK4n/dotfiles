
_so() {
    [ -r "$1" ] && [ -f "$1" ] && source "$1"
}

export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"