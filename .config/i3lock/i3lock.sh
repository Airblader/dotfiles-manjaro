#!/usr/bin/env bash
set -eu

[[ -z "$(pgrep i3lock)" ]] || exit
i3lock -n -u -t -i ${HOME}/.config/wallpapers/lock_heihei.png
