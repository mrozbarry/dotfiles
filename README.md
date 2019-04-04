# Dotfiles

Zim + Customizations


# Prereqs

 - nvm
 - rvm
 - git
 - zsh (and set as default shell)

# Install

 - `git clone git@github.com:mrozbarry/dotfiles.git ~/.dotfiles`
 - `cd .dotfiles`
 - `./scripts/osx_installers.js` to install homebrew and things
 - `./scripts/shared_installers.sh` to get rvm (ruby version manager) and nvm (node version manager)
 - `ln -sf ./zshrc ~/.zshrc`
 - `ln -sf ./vimrc ~/.vimrc` (for vim)
 - `ln -sf ./vimrc ~/.config/nvim/init.vim` (for neovim)
 - `nvim +UpdateRemotePlugins +PlugUpdate +PlugUpgrade +PlugClean +qall` to install vim plugins and updates

