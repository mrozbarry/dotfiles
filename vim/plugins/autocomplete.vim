if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
else
  Plug 'Shougo/deoplete.nvim'
endif
"Plug 'carlitux/deoplete-ternjs', {'for': 'javascript'}
"Plug 'kristijanhusak/deoplete-phpactor', {'for': 'php'}

" Plug 'ncm2/ncm2'
"if !has('nvim')
  "Plug 'roxma/nvim-completion-manager'
  "Plug 'roxma/nvim-cm-tern', {'do': 'npm install'}
"endif

" Plug 'ncm2/ncm2-bufword'
"Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-github'
"Plug 'ncm2/ncm2-cssomni', {'for': 'css'}
"Plug 'ncm2/ncm2-tern',  {'for': 'javascript', 'do': 'npm install'}
" Plug 'ObserverOfTime/ncm2-jc2', {'for': ['java', 'jsp']}
" Plug 'artur-shaik/vim-javacomplete2', {'for': ['java', 'jsp']}
"Plug 'ncm2/ncm2-markdown-subscope', {'for': 'markdown'}
"Plug 'phpactor/ncm2-phpactor', {'for': 'php'}

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'

Plug 'SirVer/Ultisnips'
