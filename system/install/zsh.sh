#!/bin/bash

ALREADY_SOURCED=$(cat ~/.zshrc | grep -c "source ~/.dotfiles/zshrc")

if [ $ALREADY_SOURCED -eq 0 ]; then
  echo "source ~/.dotfiles/zshrc" >> ~/.zshrc
fi


