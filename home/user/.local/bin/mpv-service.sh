#!/bin/sh
set -eu

SOCKET_PATH="/tmp/mpv-${USER}.sock"

rm -f "${SOCKET_PATH}"

cleanup() {
    echo "Stopping MPV service..."
    rm -f "${SOCKET_PATH}"
    pkill -P $$ mpv || true
}
trap cleanup EXIT TERM INT

exec mpv --idle --no-video --input-ipc-server="${SOCKET_PATH}" --ytdl-format=worstaudio
