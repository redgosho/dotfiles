#!/usr/bin/env bash

function script-init()
{
    set -e

    if [ -z "$DOTFILES_ROOT" ]; then
        DOTFILES_ROOT=$HOME/.dotfiles
    fi

    if [ -z "$DOTFILES_REPO" ]; then
        DOTFILES_REPO=https://github.com/redgosho/dotfiles
    fi
}

function dotfiles-install()
{
    if [ -d $DOTFILES_ROOT ]; then
        cd $DOTFILES_ROOT
        git pull origin master
    else
        git clone $DOTFILES_REPO $DOTFILES_ROOT
    fi
}

function dotfiles-init()
{
    cd $DOTFILES_ROOT
    make core
}

script-init
dotfiles-install
dotfiles-init