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
    ln -svf $DOTFILES/$target $DOTCONFIG/$target
}

if [ ! -d $DOTCONFIG ]; then
    mkdir -p $DOTCONFIG
fi

# Detect system type
SYSTEM_TYPE=$(uname -s)

echo "Detected system: $SYSTEM_TYPE"

## nvim
#echo 'Install Neovim'
#link nvim

# bash 
echo 'Install Bash'
ln -svf $DOTFILES/bash/bashrc $HOME/.bashrc
ln -svf $DOTFILES/bash/dircolors $HOME/.dircolors
if [ ! -f $HOME/.bashlocal ]; then
    cp -sf $DOTFILES/bash/bashlocal.template $HOME/.bashlocal
fi

# zsh
echo 'Install Zsh'
ln -svf $DOTFILES/zsh/zshrc $HOME/.zshrc
if [ ! -f $HOME/.zshlocal ]; then
    cp -sf $DOTFILES/zsh/zshlocal.template $HOME/.zshlocal
fi

# vim
echo 'Install Vim'
ln -svf $DOTFILES/vim/vimrc $HOME/.vimrc
ln -svf $DOTFILES/vim/ftplugin $HOME/.vim/ftplugin

# System-specific configurations
if [ "$SYSTEM_TYPE" = "Darwin" ]; then
    echo 'Applying macOS specific configurations'
    # Add macOS specific configurations here
elif [ "$SYSTEM_TYPE" = "Linux" ]; then
    echo 'Applying Linux specific configurations'
    # Add Linux specific configurations here
fi
