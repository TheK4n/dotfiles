[[ -r ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
setxkbmap -layout us -option caps:escape
exec i3
