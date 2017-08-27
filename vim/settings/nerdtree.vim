let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1
let g:NERDTreeWinSize = 40
let NERDTreeIgnore = ['node_modules$']

noremap <silent> <Leader>d :let NERDTreeQuitOnOpen = 1<bar>NERDTreeToggle<CR>
