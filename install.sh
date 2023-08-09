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
    ln -svfT $DOTFILES/$target $DOTCONFIG/$target
}

link fish
link nvim
link sakura

# bash 
echo Install bash
ln -svfT $DOTFILES/bash/bashrc $HOME/.bashrc
ln -svfT $DOTFILES/bash/dircolors $HOME/.dircolors
if [ ! -f $HOME/.bashlocal ]; then
    cp -sf $DOTFILES/bash/bashlocal.template $HOME/.bashlocal
fi
