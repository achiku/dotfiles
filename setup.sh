#!/usr/bin/env bash

current_dir=$( pwd )

if [[ -f ~/.tigrc ]]; then
    echo '.tigrc is already placed at ~/.tigrc'
else
    echo 'creating symlink for .tigrc'
    ln -sfh ${current_dir}/tigrc ~/.tigrc
fi

if [[ -f ~/.vimrc ]]; then
    echo '.vimrc is already placed at ~/.vimrc'
else
    echo 'creating symlink for .vimrc'
    ln -sfh ${current_dir}/vimrc ~/.vimrc
fi

if [[ -f ~/.gvimrc ]]; then
    echo '.gvimrc is already placed at ~/.gvimrc'
else
    echo 'creating symlink for .gvimrc'
    ln -sfh ${current_dir}/gvimrc ~/.gvimrc
fi

if [[ -f ~/.zshrc ]]; then
    echo '.zshrc is already placed at ~/.zshrc'
else
    echo 'creating symlink for .zshrc'
    ln -sfh ${current_dir}/zshrc ~/.zshrc
fi

if [[ -f ~/.psqlrc ]]; then
    echo '.psqlrc is already placed at ~/.psqlrc'
else
    echo 'creating symlink for .psqlrc'
    ln -sfh ${current_dir}/psqlrc ~/.psqlrc
fi

if [[ -f ~/.tmux.conf ]]; then
    echo '.tmux.conf is already placed at ~/.tmux.conf'
else
    echo 'creating symlink for .tmux.conf'
    ln -sfh ${current_dir}/tmux.conf ~/.tmux.conf
fi

if [[ -d ~/.tmux ]]; then
    echo '.tmux is already placed at ~/.tmux'
else
    echo 'creating symlink for .tmux.conf'
    ln -sfh ${current_dir}/tmux ~/.tmux
fi


if [[ -f ~/.gitconfig ]]; then
    echo '.gitconfig is already placed at ~/.gitconfig'
else
    echo 'creating symlink for .gitconfig'
    ln -sfh ${current_dir}/gitconfig ~/.gitconfig
fi

if [[ -f ~/.gitignore_global ]]; then
    echo '.gitignore_global is already placed at ~/.gitignore_global'
else
    echo 'creating symlink for .gitignore_global'
    ln -sfh ${current_dir}/gitignore_global ~/.gitignore_global
fi


mkdir -p ~/.config/nvim
if [[ -f ~/.config/nvim/init.vim ]]; then
    echo 'init.vim is already placed at ~/.config/nvim/init.vim'
else
    echo 'creating symlink for init.vim'
    ln -sfh ${current_dir}/nvim/init.vim ~/.config/nvim/init.vim
fi

if [[ -d ~/.config/nvim/etc ]]; then
    echo 'nvim/etc is already placed at ~/.config/nvim/etc'
else
    echo 'creating symlink for nvim/etc'
    ln -sfh ${current_dir}/nvim/etc ~/.config/nvim/etc
fi

if [[ -d ~/.config/nvim/snippets ]]; then
    echo 'nvim/snippets is already placed at ~/.config/nvim/snippets'
else
    echo 'creating symlink for nvim/snippets'
    ln -sfh ${current_dir}/nvim/snippets ~/.config/nvim/snippets
fi

if [[ -d ~/bin ]]; then
    echo 'bin is already placed at ~/bin'
else
    echo 'creating symlink for ~/bin'
    ln -sfh ${current_dir}/bin ~/bin
fi
