
if [[ "${TTY}" =~ /dev/tty* ]]; then
    setterm -blength=0
    setfont cyr-sun16
fi

if [ "${TTY}" = "/dev/tty1" ] && [ "${XDG_VTNR}" -eq 1 ] && [ -z "${DISPLAY}" ] && systemctl -q is-active graphical.target; then
    x11_dir="${XDG_STATE_HOME:-${HOME}/.local/state}/x11"
    mkdir -p "${x11_dir}"
    exec startx >> "${x11_dir}/x11.log" 2>&1

fi

# if [ "${TTY}" = "/dev/tty1" ] && [ -z "${WAYLAND_DISPLAY}" ] && [ -n "${XDG_VTNR}" ] && [ "${XDG_VTNR}" -eq 1 ] && systemctl -q is-active graphical.target; then
#     wayland_dir="${XDG_STATE_HOME:-${HOME}/.local/state}/wayland"
#     mkdir -p "${wayland_dir}"
#     exec sway --unsupported-gpu >> "${wayland_dir}/sway.log" 2>&1
# fi
