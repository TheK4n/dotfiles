# .zshrc by TheK4n
# https://github.com/TheK4n/dotfiles

if command -v tmux &>/dev/null && [ -z "$TMUX" ] && [[ ! "$TERM" =~ tmux ]]; then
    exec tmux new
fi

if [ -f $HOME/.config/zsh/sourcer ]; then
    source $HOME/.config/zsh/sourcer
fi
