call plug#begin('~/.dotfiles/vim/plugged')

for f in split(glob('~/.dotfiles/vim/plugins/*.vim'), '\n')
  exe 'source' f
endfor

call plug#end()

