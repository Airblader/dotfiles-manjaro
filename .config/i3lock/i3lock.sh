#!/usr/bin/env bash
set -eu

screenshot=$(mktemp --tmpdir i3lock-scrot-XXX.png)
lock=$(mktemp --tmpdir i3lock-final-XXX.png)
overlay="${HOME}/.config/i3lock/overlay.png"

scrot -d0 ${screenshot}
convert ${screenshot} -blur 0x5 -modulate 100,40 \
    -gravity center ${overlay} -composite \
    ${lock}

i3lock -n -u -i ${lock}

#trap "rm '${screenshot}' '${lock}'" EXIT
rm '${screenshot}' '${lock}'
