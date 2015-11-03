#!/usr/bin/env bash
xbacklight "$@"
pkill -RTMIN+2 i3blocks
