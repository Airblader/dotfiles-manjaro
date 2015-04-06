#!/usr/bin/env bash
set -eu

screenshot=$(mktemp --tmpdir i3lock-scrot-XXX.png)
blurred=$(mktemp --tmpdir i3lock-blurred-XXX.png)
lock=$(mktemp --tmpdir i3lock-final-XXX.png)
overlay="${HOME}/.config/i3lock/overlay.png"

scrot -d0 ${screenshot}
convert ${screenshot} -blur 0x5 -modulate 100,60 ${blurred}
convert -gravity center -composite ${blurred} ${overlay} ${lock}

i3lock -u -i ${lock}

trap "rm '${screenshot}' '${blurred}' '${lock}'" EXIT
