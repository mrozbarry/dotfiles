let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = system('PATH=$(npm bin):$PATH && which eslint | tr -d "\n"')

call neomake#configure#automake('nrwi', 500)

" Go to current eslint error
nmap <Leader><Space>, :ll<CR>

autocmd! BufWritePost * Neomake
