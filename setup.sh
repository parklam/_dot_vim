#!/bin/bash

if ! type "git" > /dev/null; then
    echo "Command 'git' is not found. Please install 'git' first!"
fi

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .vimrc ~/.vimrc
echo "Please execute \"vim -c ':PluginInstall'\" to complete installation."
