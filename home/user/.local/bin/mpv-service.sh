#!/bin/sh -eu

SOCKET_PATH="/tmp/mpv-${USER}.sock"

rm -f "${SOCKET_PATH}"

cleanup() {
    echo "Stopping MPV service..."
    rm -f "${SOCKET_PATH}"
    pkill -P $$ mpv || true
}
trap cleanup EXIT TERM INT

exec mpv \
    --really-quiet \
    --idle \
    --no-video --force-window=no \
    --input-ipc-server="${SOCKET_PATH}" \
    --demuxer-max-bytes=50MiB \
    --demuxer-max-back-bytes=10MiB \
    --audio-buffer=0.5
