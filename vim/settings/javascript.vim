let g:jsx_ext_required = 0
let g:import_sort_auto = 0

hi def Function cterm=bold gui=bold
hi def jsVariableDef cterm=bold gui=bold

autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab smarttab foldmethod=syntax nofoldenable

let g:vue_disable_pre_processors=1
