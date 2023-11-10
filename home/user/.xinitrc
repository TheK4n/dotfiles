[[ -r ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources


session=${1:-i3}

case $session in
    i3|i3wm           ) exec i3;;
    kde               ) exec startplasma-x11;;
    xfce|xfce4        ) exec startxfce4;;
    *                 ) exec $1;;
esac
