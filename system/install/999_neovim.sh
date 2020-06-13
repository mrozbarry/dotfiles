#!/bin/bash

DATE_WITH_TIME=`date "+%Y%m%d-%H%M%S"`

(pip3 install --user pynvim || pip install --user pynvim)
npm i -g neovim

mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim
mv -f ~/.config/nvim/init.vim "~/.config/nvim/init.vim.$DATE_WITH_TIME"

ALREADY_SOURCED=$(cat ~/.config/nvim/init.vim | grep -c "source ~/.dotfiles/vimrc")
if [[ $ALREADY_SOURCED -eq 0 ]]; then
  echo "source ~/.dotfiles/vimrc" >> ~/.config/nvim/init.vim
fi

source ~/.dotfiles/system/update/neovim.sh
