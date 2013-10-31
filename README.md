#My dotfiles.

## Installation

    git clone https://github.com/singhsaysdotcom/dotfiles ~/dotfiles
    ~/dotfiles/scripts/setup.sh

##.vim setup

  + add new submodules with

    `cd ~/dotfiles; git submodule add $REPO bundle/$REPONAME; git submodule init && git submodule update`

  + update submodules with

    `cd ~/dotfiles; git submodule foreach git pull`
