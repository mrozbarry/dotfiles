for f in split(glob('~/.dotfiles/vim/settings/*.vim'), '\n')
  exe 'source' f
endfor

