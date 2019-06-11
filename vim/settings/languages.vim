let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fixes = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'javascript': ['prettier', 'eslint']
\}

autocmd FileType php setlocal ts=4 sw=4 sts=4 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab
