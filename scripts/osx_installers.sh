#!/usr/bin/env sh

if [ -x "$(command -v brew)" ]; then
  echo "Installing homebrew..."
  echo ""

  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install neovim python3 zsh zsh-completions the_silver_searcher fzf fd
