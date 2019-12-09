#!/bin/bash

title() {
  echo "********************************"
  echo "  $1"
  echo "********************************"
}

install_osx() {

  title "Homebrew"

  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  brew update
  brew install fzf python git

  # -----------------------------------------

  title "Node version manager (nvm)"

  export NVM_DIR="$HOME/.nvm"

  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash

  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

  nvm install --lts --latest-npm
  nvm use --lts
}

install_zsh() {
  git clone --recursive https://github.com/zimfw/zimfw.git ${ZDOTDIR:-${HOME}}/.zim
  ln -s ${ZDOTDIR:-${HOME}}/.zim/templates/zimrc ~/.zimrc
}

install_tmux() {
  ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
}

install_neovim() {
  (pip3 install --user pynvim || pip install --user pynvim)
  npm i -g neovim

  rm -f ~/.config/nvim/init.vim
  ln -s ./vimrc ~/.config/nvim/init.vim

  nvim +UpdateRemotePlugins +PlugUpgrade +PlugInstall +PlugUpdate +PlugClean +qall
}

install_osx
install_zsh
install_tmux
install_neovim

echo ""
echo ""
echo "To complete installation, add:"
echo "   source ~/.dotfiles/zhrc"
echo "To your ~/.zshrc file"
