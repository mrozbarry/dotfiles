let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1
let g:NERDTreeWinSize = 40
let NERDTreeShowHidden = 1

noremap <silent> <Leader>d :let NERDTreeQuitOnOpen = 1<bar>NERDTreeToggle<CR>

" NERDTress File highlighting
 function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
 endfunction
 
" Mitigate syntax highlighting lag
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeSyntaxEnableExtensions = ['js', 'css', 'html', 'sass', 'scss', 'yml', 'rb', 'json', 'php', 'md']
