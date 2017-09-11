if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>

nnoremap <esc> :noh<return><esc>
