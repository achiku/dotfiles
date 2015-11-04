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

if [[ -f ~/.tmux.conf ]]; then
    echo '.tmux.conf is already placed at ~/.tmux.conf'
else
    echo 'creating symlink for .tmux.conf'
    ln -s ${current_dir}/tmux.conf ~/.tmux.conf
fi

if [[ -f ~/.config/nvim/init.vim ]]; then
    echo '.nvimrc is already placed at ~/.nvimrc'
else
    echo 'creating symlink for init.vim'
    ln -s ${current_dir}/nvimrc ~/.config/nvim/init.vim
fi
