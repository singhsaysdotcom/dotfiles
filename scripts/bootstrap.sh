#!/bin/bash


if [[ $('uname') == 'Darwin' ]]; then
  ~/dotfiles/scripts/osx.sh
fi


echo "Creating symlinks ..."
ln -sf ~/dotfiles/vim ~/.vim
ln -sf ~/dotfiles/vim/vimrc ~/.vimrc
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf

