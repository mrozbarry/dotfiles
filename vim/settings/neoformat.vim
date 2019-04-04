" let g:neoformat_try_formatprg = 1
"
" augroup NeoformatAutoFormat
"   autocmd!
"   autocmd FileType javascript setlocal formatprg=prettier\
"                                             \--stdin
"   autocmd BufWritePre *.js undojoin | Neoformat
" augroup END
