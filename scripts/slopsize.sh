#!/usr/bin/env bash
set -eu

eval $(slop -b 3 -c 0.96,0.5,0.09 -t 0) && xdotool getactivewindow windowmove $X $Y && xdotool getactivewindow windowsize $W $H
