#!/bin/bash

set -o nounset

DOTFILES="$HOME/projects/dotfiles"
DOTCONFIG="$HOME/.config"

function link
{
    target=$1
    if [ -z "$target" ] || [ ! -e "$DOTFILES/$target" ]; then
        echo "Error: please specify a vaild target!"
        exit 1
    fi
    echo "Install $target"
    ln -sf $DOTFILES/$target $DOTCONFIG/$target
}

link fish
link nvim
link sakura

# bash 
echo Install bash
ln -sf $DOTFILES/bash/bashrc $HOME/.bashrc
ln -sf $DOTFILES/bash/dircolors $HOME/.dircolors
if [ ! -f $HOME/.bashlocal ]; then
    cp -sf $DOTFILES/bash/bashlocal.template $HOME/.bashlocal
fi
