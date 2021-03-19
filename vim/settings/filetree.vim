nnoremap <silent> <Leader>d :Fern . -drawer<cr>
nnoremap <silent> <Leader>fo :Fern .<cr>

let g:fern#renderer = "nerdfont"
let g:fern#default_hidden = 1
let g:fern#smart_cursor = "stick"
let g:fern#opener = "edit/vsplit"
