#!/bin/sh

set -ue


readonly EXIT_SUCCESS=0
readonly EXIT_FAILURE=1


cmd_wireless() {
    wifiname="$(LANG=C nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)"
    wifi_ip=$(ip -o -4 addr show | grep wlp | awk '{print $4}' | cut -d/ -f1 | head -1)

    if [ -z "${wifiname}" ] || [ -z "${wifi_ip}" ]; then
        return 0
    fi

    printf ' %s %s\n' "${wifiname}" "${wifi_ip}"
}

cmd_battery() {
    charging_status="$(cat /sys/class/power_supply/BAT0/status)"
    percent="$(cat /sys/class/power_supply/BAT0/capacity)"

    if [ "${percent}" -lt 35 ]; then
        emoji_status="🪫"
    else
        emoji_status="🔋"
    fi

    if [ "${charging_status}" = "Charging" ]; then
        emoji_status="🔌"
    fi

    printf "%s %s%%\n" "${emoji_status}" "${percent}"
}

cmd_disk_root() {
    df -h / | awk '/\// {print "/ "$3"/"$2}'
}

cmd_disk_home() {
    res="$(df -h /home)"
    if [ "$(echo "${res}" | awk '/\// {print $6}')" = "/" ]; then
        return 1
    fi
    df -h /home | awk '/\// {print "  "$3"/"$2}'
}

cmd_memory() {
    free -h | awk '/^Mem/ {print "🎟 "$3"/"$2}' | sed 's/i//g'
}

cmd_cpu_usage() {
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print "  "100 - $1"%"}'
}

cmd_cpu_temp() {
    temp_mC="$(cat /sys/class/thermal/thermal_zone0/temp)"
    temp_C="$((temp_mC / 1000))"

    if [ "${temp_C}" -gt 80 ]; then
        printf '<span foreground="red"> %s°C</span>\n' "${temp_C}"
    else
        printf ' %s°C\n' "${temp_C}"
    fi
}

cmd_time() {
    LC_ALL=C date '+  %d.%m.%y %a     %H:%M'
}

cmd_volume() {
    value="$(pactl --format=json get-sink-volume @DEFAULT_SINK@ | jq --raw-output '.volume."front-left".value_percent')"
    printf '  %s\n' "${value}"
}

cmd_pomodoro() {
    pomodoro get
}

cmd_bluetooth_battery() {
    device="$(upower -e | grep headset | head -1)"
    upower -i "${device}" | grep percentage | awk '{ print "🎧🔋"$2"" }'
}

cmd_language() {
    layout="$(swaymsg -t get_inputs | jq -r '.[] | select(.type == "keyboard") | .xkb_active_layout_name' | head -1)"

    case "${layout}" in
        "English (US)")
            printf '🇬🇧 En\n'
            ;;
        Russian)
            printf '🇷🇺 Ru\n'
            ;;
        *)
            printf '🌐 %s\n' "${layout}"
            ;;
    esac
}

cmd_userhost() {
    printf "%s@%s\n" "${USER}" "${HOST:-${HOSTNAME:-}}"
}

case "${1}" in
    wireless) shift;           cmd_wireless          "$@" ;;
    ethernet) shift;           cmd_ethernet          "$@" ;;
    battery) shift;            cmd_battery           "$@" ;;
    disk_root) shift;          cmd_disk_root         "$@" ;;
    disk_home) shift;          cmd_disk_home         "$@" ;;
    memory) shift;             cmd_memory            "$@" ;;
    cpu_usage) shift;          cmd_cpu_usage         "$@" ;;
    cpu_temp) shift;           cmd_cpu_temp          "$@" ;;
    time) shift;               cmd_time              "$@" ;;
    volume) shift;             cmd_volume            "$@" ;;
    pomodoro) shift;           cmd_pomodoro          "$@" ;;
    bluetooth_battery) shift;  cmd_bluetooth_battery "$@" ;;
    language) shift;           cmd_language          "$@" ;;
    userhost) shift;           cmd_userhost          "$@" ;;

    *) exit "${EXIT_FAILURE}" ;;
esac
exit "${EXIT_SUCCESS}"
