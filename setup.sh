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
    echo 'init.vim is already placed at ~/.config/nvim/init.vim'
else
    echo 'creating symlink for init.vim'
    ln -s ${current_dir}/nvim/init.vim ~/.config/nvim/init.vim
fi

if [[ -d ~/.config/nvim/etc ]]; then
    echo 'nvim/etc is already placed at ~/.config/nvim/etc'
else
    echo 'creating symlink for nvim/etc'
    ln -s ${current_dir}/nvim/etc ~/.config/nvim/etc
fi

if [[ -d ~/.config/nvim/snippets ]]; then
    echo 'nvim/snippets is already placed at ~/.config/nvim/snippets'
else
    echo 'creating symlink for nvim/snippets'
    ln -s ${current_dir}/nvim/snippets ~/.config/nvim/snippets
fi
