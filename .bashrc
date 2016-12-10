if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

xhost +local:root > /dev/null 2>&1
if [ -z "$DISPLAY" -a $XDG_VTNR -eq 1 ]; then
    ssh-agent startx
fi

complete -cf sudo

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth
export JAVA_FONTS=/usr/share/fonts/TTF
export EDITOR=/usr/bin/nano

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano PKGBUILD'
alias fixit='sudo rm -f /var/lib/pacman/db.lck && sudo pacman-mirrors -g && sudo pacman -Syyuu  && 
sudo pacman -Suu'

BROWSER=/usr/bin/xdg-open


ESC=$'['
END_ESC=m

NOPRINT='\['
END_NOPRINT='\]'

WRAP="$NOPRINT$ESC"
END_WRAP="$END_ESC$END_NOPRINT"

RESET="${WRAP}0${END_WRAP}"
RESET_BG="${WRAP}49${END_WRAP}"

NORMAL="${WRAP}21${END_WRAP}"
BOLD="${WRAP}1${END_WRAP}"

function __fg_color {
    printf "%s" "${WRAP}38;5;${1}${END_WRAP}"
}

function __bg_color {
    printf "%s" "${WRAP}48;5;${1}${END_WRAP}"
}

BLACK=$(__fg_color 0)
RED=$(__fg_color 1)
GREEN=$(__fg_color 2)
YELLOW=$(__fg_color 3)
BLUE=$(__fg_color 4)
PURPLE=$(__fg_color 5)
CYAN=$(__fg_color 6)
WHITE=$(__fg_color 7)

ALT_BLACK=$(__fg_color 8)
ALT_RED=$(__fg_color 9)
ALT_GREEN=$(__fg_color 10)
ALT_YELLOW=$(__fg_color 11)
ALT_BLUE=$(__fg_color 12)
ALT_PURPLE=$(__fg_color 13)
ALT_CYAN=$(__fg_color 14)
ALT_WHITE=$(__fg_color 15)

BLACK_BG=$(__bg_color 0)
RED_BG=$(__bg_color 1)
GREEN_BG=$(__bg_color 2)
YELLOW_BG=$(__bg_color 3)
BLUE_BG=$(__bg_color 4)
PURPLE_BG=$(__bg_color 5)
CYAN_BG=$(__bg_color 6)
WHITE_BG=$(__bg_color 7)

ALT_BLACK_BG=$(__bg_color 8)
ALT_RED_BG=$(__bg_color 9)
ALT_GREEN_BG=$(__bg_color 10)
ALT_YELLOW_BG=$(__bg_color 11)
ALT_BLUE_BG=$(__bg_color 12)
ALT_PURPLE_BG=$(__bg_color 13)
ALT_CYAN_BG=$(__bg_color 14)
ALT_WHITE_BG=$(__bg_color 15)

if [ -d ~/.bash.d ]; then
    for i in ~/.bash.d/*; do
        [ -f "${i}" ] && source "${i}"
    done
fi
