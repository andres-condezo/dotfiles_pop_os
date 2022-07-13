#!/usr/bin/env bash

tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    exit 0
fi

session_to_kill="$(tmux list-sessions | sed -n '/(attached)/s/:.*//p')"
session_to_switch="$(tmux list-sessions | sed -n '/(attached)/!s/:.*//p' | head -n 1)"

if [[ ! -z $session_to_switch ]]; then
    tmux switch-client -t $session_to_switch 
fi

tmux kill-session -t $session_to_kill
