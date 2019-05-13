let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fixes = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'javascript': ['prettier', 'eslint']
\}
