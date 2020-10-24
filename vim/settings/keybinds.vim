" nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>

nnoremap <esc> :noh<return><esc>

" Tests

nnoremap <Leader>tf :TestFile<return>

"move to the split in the direction shown, or create a new split
nnoremap <silent> <C-h> :w<cr> :call WinMove('h')<cr>
nnoremap <silent> <C-j> :w<cr> :call WinMove('j')<cr>
nnoremap <silent> <C-k> :w<cr> :call WinMove('k')<cr>
nnoremap <silent> <C-l> :w<cr> :call WinMove('l')<cr>

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction




nnoremap <silent> <Leader>sr :so $MYVIMRC<cr>
