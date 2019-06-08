set background=light
let g:one_allow_italics = 1
colorscheme one

hi Normal ctermbg=none ctermfg=none guibg=none
hi MatchParen cterm=underline,bold ctermbg=none ctermfg=white
"call one#highlight('CursorLine', 'none', '3c424c', '')

set cursorline

let g:airline_theme='one'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
