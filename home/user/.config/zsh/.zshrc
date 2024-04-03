# .zshrc by TheK4n
# https://github.com/TheK4n/dotfiles

if \
  [ "$(tty)" != "/dev/tty3" ] && \
  [ -z "$TMUX" ]              && \
  [[ ! "$TERM" =~ tmux ]]     && \
  command -v tmux &>/dev/null
then
    exec tmux
fi

if [ -f "$ZDOTDIR/sourcer" ]; then
    source "$ZDOTDIR/sourcer"
fi