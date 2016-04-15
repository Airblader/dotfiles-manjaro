#!/usr/bin/env bash
last=

xprop -root -spy _NET_ACTIVE_WINDOW | while :
do
    read line

    [[ -z "$last" ]] || i3-msg "[id=$last] mark --add last"
    _last=$(echo "$line" | awk -F' ' '{printf $NF}')
    [[ "$_last" = "0x0" ]] || last="$_last"
done
