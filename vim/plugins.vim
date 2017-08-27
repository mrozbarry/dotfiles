set nocompatible
filetype off
set rtp+=~/.dotfiles/vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

for f in split(glob('~/.dotfiles/vim/plugins/*.vim'), '\n')
  exe 'source' f
endfor

filetype plugin indent on
filetype on
syntax on
