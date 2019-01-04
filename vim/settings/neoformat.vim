augroup fmt
  autocmd!
  autocmd BufWritePre,InsertLeave *.js undojoin | Neoformat
augroup END
