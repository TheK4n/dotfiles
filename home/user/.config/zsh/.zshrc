# .zshrc by TheK4n
# https://github.com/TheK4n/dotfiles

if \
  [ "$(tty)" != "/dev/tty3" ] && \
  command -v tmux &>/dev/null && \
  [ -z "$TMUX" ]              && \
  tmux -N -L "$USER" list-sessions &>/dev/null
then
    exec tmux -N -L "$USER" new-session
fi

if [ -f "$ZDOTDIR/sourcer" ]; then
    source "$ZDOTDIR/sourcer"
fi

if \
  command -v tmux &>/dev/null && \
  [ -n "$TMUX" ] && \
  [ -n "$SSH_CLIENT" ]
then
    tmux source-file "$XDG_CONFIG_HOME/tmux/remote.conf"
fi