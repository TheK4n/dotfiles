# .zshrc by TheK4n
# https://github.com/TheK4n/dotfiles

if \
  [ "$(tty)" != "/dev/tty3" ] && \
  [ -z "$TMUX" ]              && \
  command -v tmux &>/dev/null && \
  tmux -N -L "$USER" list-sessions &>/dev/null
then
    exec tmux -N -L "$USER" new-session
fi

if [ -f "$ZDOTDIR/sourcer" ]; then
    source "$ZDOTDIR/sourcer"
fi