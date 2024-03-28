# .zshrc by TheK4n
# https://github.com/TheK4n/dotfiles

TMUX_MAIN_SESSION="main"

if command -v tmux &>/dev/null && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    if tmux has-session -t "$TMUX_MAIN_SESSION" &>/dev/null; then
        exec tmux new-session -t "$TMUX_MAIN_SESSION"
    else
        exec tmux new-session -s "$TMUX_MAIN_SESSION"
    fi
fi

if [ -f "$ZDOTDIR/sourcer" ]; then
    source "$ZDOTDIR/sourcer"
fi