#!/bin/sh
# vim:ts=4:sw=4:expandtab

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xrdb -load ~/.Xresources

xset s off
xset b off
xset -dpms
xset s noblank

xset r rate 200 20

setxkbmap de nodeadkeys
setxkbmap -option ctrl:nocaps
xmodmap -e 'clear lock'
xmodmap -e 'keycode 66 = Hyper_L'

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

exec i3
