#!/usr/bin/env bash

current_dir=$( pwd )

if [[ -f ~/.vimrc ]]; then
    echo '.vimrc is already placed at ~/.vimrc'
else
    echo 'creating symlink for .vimrc'
    ln -s ${current_dir}/vimrc ~/.vimrc
fi

if [[ -f ~/.gvimrc ]]; then
    echo '.gvimrc is already placed at ~/.gvimrc'
else
    echo 'creating symlink for .gvimrc'
    ln -s ${current_dir}/gvimrc ~/.gvimrc
fi

if [[ -f ~/.zshrc ]]; then
    echo '.zshrc is already placed at ~/.zshrc'
else
    echo 'creating symlink for .zshrc'
    ln -s ${current_dir}/zshrc ~/.zshrc
fi
