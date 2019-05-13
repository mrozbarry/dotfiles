if executable('eslint')
  set statusline+=\ %#ErrorMsg#%{neomake#statusline#QflistStatus('qf:\ ')}

  let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
  let g:neomake_javascript_enabled_makers = ['eslint']

  call neomake#configure#automake('wi')

  " Go to current eslint error
  nmap <Leader><Space>, :ll<CR>

  autocmd! BufWritePost * Neomake
endif
