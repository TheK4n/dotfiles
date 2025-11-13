
if [[ "${TTY}" =~ /dev/tty* ]]; then
    setterm -blength=0
    setfont cyr-sun16
fi

if [ "${TTY}" = "/dev/tty1" ] && [ -z "${WAYLAND_DISPLAY}" ] && [ -z "${DISPLAY}" ]; then
    wayland_dir="${XDG_STATE_HOME:-${HOME}/.local/state}/wayland"
    mkdir -p "${wayland_dir}"
    exec sway >> "${wayland_dir}/sway.log" 2>&1
fi
