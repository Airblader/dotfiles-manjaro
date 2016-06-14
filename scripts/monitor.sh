#!/usr/bin/env bash

xrandr -q | grep -wv eDP1 | grep connected | \
while read line; do
    output=$(echo "$line" | awk -F' ' '{print $1}')

    connected=$(echo "$line" | grep -w "connected")
    activated=$(echo "$line" | grep "connected [0-9]")

    if [[ ! -z "$connected" ]]; then
        echo "    ${output} "

        if [[ ! -z "$activated" ]]; then
            [[ -z "${BLOCK_BUTTON}" ]] || {
                xrandr --output "${output}" --off
                pkill -RTMIN+4 i3blocks
            }
        else
            [[ -z "${BLOCK_BUTTON}" ]] || {
                xrandr --auto
                xrandr --output "${output}" --right-of eDP1
                pkill -RTMIN+4 i3blocks
            }

            exit 33
        fi

        exit 0
    else
        if [[ ! -z "$activated" ]]; then
            echo "    ${output} "

            [[ -z "${BLOCK_BUTTON}" ]] || {
                xrandr --output "${output}" --off
                pkill -RTMIN+4 i3blocks
            }

            exit 33
        fi
    fi
done
