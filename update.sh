#!/bin/bash

git pull origin master
git submodule update --init --recursive

for update_script in $HOME/.dotfiles/system/update/*.sh; do
  source $update_script
done
