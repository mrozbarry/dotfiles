" Solarized
if has('nvim')
  colorscheme NeoSolarized
  let g:neosolarized_contrast = 'high'
  let g:neosolarized_visibility = 'normal'
  let g:neosolarized_vertSplitBgTrans = 1
  set background=dark
else
  set background=dark
  colorscheme solarized
  let g:solarized_termcolors=256
  let g:solarized_contrast='high'
endif

" Indentation
"let g:indentLine_char = '.'

hi MatchParen cterm=underline,bold ctermbg=none ctermfg=white

set cursorline
