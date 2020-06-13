#!/bin/bash

if [ -d ~/.tmux ]; then

  cd ~/.tmux/plugins/tpm
  git pull

else

  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

fi
