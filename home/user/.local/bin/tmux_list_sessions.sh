#!/usr/bin/env bash


declare current_session
current_session="$(tmux display-message -p '#S')"
readonly current_session

declare last_session
last_session="$(tmux display-message -p '#{client_last_session}')"
readonly last_session

declare sessions
sessions="$(tmux list-session -F '#S#{?session_attached, (attached) , }')"
sessions="$(echo "${sessions}" | sed "s/^${current_session} /${current_session} (current) /")"
sessions="$(echo "${sessions}" | sed "s/^${last_session} /${last_session} (last) /")"
readonly sessions

echo "${sessions}"