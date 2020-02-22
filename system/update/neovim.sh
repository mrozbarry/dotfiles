#/bin/bash

nvim --headless +UpdateRemotePlugins +PlugUpgrade +PlugInstall +PlugUpdate +PlugClean +qall
nvim --headless -c 'CocInstall -sync coc-json coc-php coc-tsserver coc-css coc-svg coc-eslint coc-html coc-inline-jest coc-tailwindcss|q'
