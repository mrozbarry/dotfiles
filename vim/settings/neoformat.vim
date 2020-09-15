augroup NeoformatAutoFormat
  autocmd!
  autocmd FileType javascript setlocal formatprg=prettier-eslint\
                                            \--stdin
  autocmd BufWritePre *.js undojoin | Neoformat
  " autocmd BufWritePre *.js Neoformat
augroup END

let g:neoformat_try_formatprg = 1
