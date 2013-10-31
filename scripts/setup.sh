#!/bin/bash

# Constants
FONTSURL="https://www.dropbox.com/sh/qva0hsl27654j9y/EvCtKcQ6GF?dl=1"
TMPDIR=`mktemp -d`

# ask for sudo credentials upfront and keep refreshing till finished.
sudo -v
while true; do sudo -n true; sleep 10; kill -0 "$$" || exit; done 2>/dev/null &


# Install required packages.
function install_packages {
  sudo apt-get -qq update
  sudo apt-get -qq install vim git
  [[ "$?" -eq 0 ]] && logok || logerr
}


# Clone dotfiles repo.
function clone_dotfiles {
  git clone git@github.com:singhsaysdotcom/dotfiles.git $HOME/dotfiles
}


# Setup symlinks
function setup_symlinks {
  ln -sf "$HOME/dotfiles/vim" "$HOME/.vim"
  ln -sf "$HOME/dotfiles/vimrc" "$HOME/.vimrc"
  ln -sf "$HOME/dotfiles/tmux.conf" "$HOME/.tmux.conf"
  ln -sf "$HOME/dotfiles/zshrc" "$HOME/.zshrc"
}

# Install fonts
function install_fonts {
  curl -Li -o "$TMPDIR/fonts.zip" "$FONTSURL"
  if [[ ! -e "$HOME/.fonts" ]]; then
    mkdir -p "$HOME/.fonts"
  fi
  unzip -qq -od "$HOME/.fonts" "$TMPDIR/fonts.zip" 2>/dev/null
  fc-cache -f "$HOME/.fonts"
}


function cleanup {
  rm -Rf "$TMPDIR"
  [[ "$?" -eq 0 ]] && logok || logerr
}

install_packages
install_fonts
cleanup