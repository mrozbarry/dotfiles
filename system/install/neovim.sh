#!/bin/bash

DATE_WITH_TIME=`date "+%Y%m%d-%H%M%S"`

(pip3 install --user pynvim || pip install --user pynvim)
npm i -g neovim

if [[ -f ~/.config/nvim/init.vim ]]; then
  mv -f ~/.config/nvim/init.vim "~/.config/nvim/init.vim.$DATE_WITH_TIME"
fi

echo "source ~/.dotfiles/vimrc" >> ~/.config/nvim/init.vim

source ~/.dotfiles/system/update/neovim.sh
