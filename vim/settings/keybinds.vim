" nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>

nnoremap <esc> :noh<return><esc>

" fzf

nnoremap <Leader>f :FZF<CR>

" Tests

nnoremap <Leader>tf :TestFile<return>

"move to the split in the direction shown, or create a new split
nnoremap <silent> <C-h> :call WinMove('h')<cr>
nnoremap <silent> <C-j> :call WinMove('j')<cr>
nnoremap <silent> <C-k> :call WinMove('k')<cr>
nnoremap <silent> <C-l> :call WinMove('l')<cr>

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

nnoremap <Leader>sr :so $MYVIMRC<cr>
