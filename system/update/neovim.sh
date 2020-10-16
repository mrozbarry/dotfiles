#/bin/bash

nvim +UpdateRemotePlugins +PlugUpgrade +PlugInstall +PlugUpdate +PlugClean +qall
nvim -c 'CocInstall -sync coc-json coc-phpls coc-tsserver coc-css coc-eslint coc-html coc-tailwindcss coc-flutter|q' +qall
