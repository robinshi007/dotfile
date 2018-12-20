" === general ===
syntax enable
filetype indent on

set encoding=utf8
set number
set nomodeline
set showmatch
set novisualbell
set undolevels=100
set clipboard=unnamed
set nowrap
set hidden
autocmd FileType markdown setlocal wrap

set backspace=indent,eol,start
set iskeyword+=-

" === turn off swap files ===
set noswapfile
set nobackup
set nowritebackup

" === search ===
set hlsearch
set incsearch
set ignorecase
set smartcase

" === fold ===
set nofoldenable
set foldmethod=syntax

" === indentation ===
set autoindent
set smartindent
set smarttab

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set colorcolumn=80

" == fold ===
set foldmethod=syntax
set nofoldenable
set foldlevel=99

" === scrolling ===
set scrolloff=1
set sidescrolloff=5
" === mouse ===
" disable mouse
set mouse=r
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" === auto commands ===
"

" === funcitons ===
"
