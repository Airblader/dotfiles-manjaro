#!/usr/bin/env bash

gopass ls --flat | rofi -dmenu -p gopass | xargs --no-run-if-empty gopass show -f | head -n 1 | xdotool type --clearmodifiers --file -
