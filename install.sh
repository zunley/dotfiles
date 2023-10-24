#!/bin/bash

set -o nounset

DOTFILES=$(dirname $(readlink -f $0))
DOTCONFIG="$HOME/.config"

function link
{
    target=$1
    if [ -z "$target" ] || [ ! -e "$DOTFILES/$target" ]; then
        echo "Error: please specify a vaild target!"
        exit 1
    fi
    ln -svfT $DOTFILES/$target $DOTCONFIG/$target
}

if [ ! -d $DOTCONFIG ]; then
    mkdir $DOTCONFIG
fi

# nvim
echo 'Install Neovim'
link nvim

# bash 
echo 'Install Bash'
ln -svfT $DOTFILES/bash/bashrc $HOME/.bashrc
ln -svfT $DOTFILES/bash/dircolors $HOME/.dircolors
if [ ! -f $HOME/.bashlocal ]; then
    cp -sf $DOTFILES/bash/bashlocal.template $HOME/.bashlocal
fi

# vim
echo 'Install Vim'
ln -svfT $DOTFILES/vim/vimrc $HOME/.vimrc
