set nocompatible
filetype off
set rtp+=~/.dotfiles/vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

for f in split(glob('~/.dotfiles/vim/plugins/*.vim'), '\n')
  exe 'source' f
endfor

call vundle#end()

filetype plugin indent on
filetype on
syntax on
