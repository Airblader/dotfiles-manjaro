#!/usr/bin/env bash
set -eu
#i3lock -n -u -t -i ${HOME}/.config/wallpapers/space.png
i3lock -n -u -t -i ${HOME}/.config/i3lock/lock.png

#screenshot=$(mktemp --tmpdir i3lock-scrot-XXX.png)
#lock=$(mktemp --tmpdir i3lock-final-XXX.png)
#overlay="${HOME}/.config/i3lock/overlay.png"

#scrot -d0 ${screenshot}

# lock initially to compensate for the delay
#i3lock -u -c 000000

#convert ${screenshot} -blur 0x5 -modulate 100,40 \
#    -gravity center ${overlay} -composite \
#    ${lock}

#killall i3lock
#i3lock -n -u -i ${lock}

#rm '${screenshot}' '${lock}'
