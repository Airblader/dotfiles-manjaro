#!/usr/bin/env bash
set -e

ask() {
  # http://djm.me/ask
  while true; do

    if [ "${2:-}" = "Y" ]; then
      prompt="Y/n"
      default=Y
    elif [ "${2:-}" = "N" ]; then
      prompt="y/N"
      default=N
    else
      prompt="y/n"
      default=
    fi

    # Ask the question
    read -p "$1 [$prompt] " REPLY

    # Default?
    if [ -z "$REPLY" ]; then
       REPLY=$default
    fi

    # Check if the reply is valid
    case "$REPLY" in
      Y*|y*) return 0 ;;
      N*|n*) return 1 ;;
    esac

  done
}

dir=`pwd`
if [ ! -e "${dir}/${0}" ]; then
  echo "Script not called from within repository directory. Aborting."
  exit 2
fi
dir="${dir}/.."

distro=`lsb_release -si`
if [ ! -f "dependencies-${distro}" ]; then
  echo "Could not find file with dependencies for distro ${distro}. Aborting."
  exit 2
fi

ask "Install packages?" Y && bash ./dependencies-${distro}

ask "Install python2 modules?" Y && {
  sudo pip2 install pyyaml
}

ask "Install symlink for .gitconfig?" Y && ln -sfn ${dir}/.gitconfig ${HOME}/.gitconfig
ask "Install symlink for .bashrc?" Y && ln -sfn ${dir}/.bashrc ${HOME}/.bashrc
ask "Install symlink for .bash_profile?" Y && ln -sfn ${dir}/.bash_profile ${HOME}/.bash_profile
ask "Install symlink for .vimrc?" Y && ln -sfn ${dir}/.vimrc ${HOME}/.vimrc
ask "Install symlink for .Xresources?" Y && ln -sfn ${dir}/.Xresources ${HOME}/.Xresources
ask "Install symlink for .xinitrc?" Y && ln -sfn ${dir}/.xinitrc ${HOME}/.xinitrc
ask "Install symlink for .compton.conf?" Y && ln -sfn ${dir}/.compton.conf ${HOME}/.compton.conf
ask "Install symlink for .gtkrc-2.0?" Y && ln -sfn ${dir}/.gtkrc-2.0 ${HOME}/.gtkrc-2.0

ask "Install symlink for .i3/?" Y && ln -sfn ${dir}/.i3 ${HOME}/.i3
ask "Install symlink for .vim/?" Y && ln -sfn ${dir}/.vim ${HOME}/.vim
ask "Install symlink for .bash.d/?" Y && ln -sfn ${dir}/.bash.d ${HOME}/.bash.d
ask "Install symlink for .config/?" Y && ln -sfn ${dir}/.config ${HOME}/.config
ask "Install symlink for .weechat/?" Y && ln -sfn ${dir}/.weechat ${HOME}/.weechat

ask "Install symlink for scripts/?" Y && ln -sfn ${dir}/scripts ${HOME}/scripts
