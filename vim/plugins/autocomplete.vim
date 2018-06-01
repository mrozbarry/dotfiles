if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'carlitux/deoplete-ternjs'
Plug 'roxma/nvim-completion-manager'
if !has('nvim')
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'roxma/nvim-cm-tern', {'do': 'npm install'}


" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'runoshun/tscompletejob'
" Plug 'felixfbecker/php-language-server', { 'do': 'composer install && composer run-script parse-stubs' }
" Plug 'prabirshrestha/asyncomplete-tscompletejob.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Plug 'prabirshrestha/asyncomplete-flow.vim'
