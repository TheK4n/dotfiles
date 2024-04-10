# .zshrc by TheK4n
# https://github.com/TheK4n/dotfiles

if \
  [ "$(tty)" != "/dev/tty3" ] && \
  [ -z "$TMUX" ]              && \
  [[ ! "$TERM" =~ tmux ]]     && \
  command -v tmux &>/dev/null
then
    if systemctl -q --user is-active tmux; then
        exec tmux -N -L "$USER" new-session -A
    else
        exec tmux new-session -A
    fi
fi

if [ -f "$ZDOTDIR/sourcer" ]; then
    source "$ZDOTDIR/sourcer"
fi