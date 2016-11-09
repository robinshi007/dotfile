" RTF
" go to last edit: gi OR `.
" go to older in change list: g;
" go to newer in change list: g,
" go to older/newer in jump list: ctrl+o/ctrl+i

set nocompatible

call plug#begin($HOME.'/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'altercation/vim-colors-solarized'
Plug 'evanmiller/nginx-vim-syntax'
call plug#end()
syntax enable
filetype indent on


set number
set showmatch
set novisualbell

set hlsearch
set smartcase
set ignorecase
set incsearch

set autoindent
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
set backspace=indent,eol,start

" statusline
if has("statusline")
    set laststatus=2
    set statusline=%<%f
    set statusline+=%w%m%r%h
    set statusline+=%=
    set statusline+=[%{strlen(&ft)?&ft:'none'}
    set statusline+=/%{&fenc!=''?&fenc:&enc}
    set statusline+=%{(exists(\"+bomb\")\&&\&bomb)?\",BOM\":\"\"}
    set statusline+=/%{&ff}]
    set statusline+=\(%l\ %L,\%c\ %P)

endif

" theme
set background=dark
let g:solarized_contrast="high"
let g:solarized_termcolors=16
colorscheme solarized

" directory
set noswapfile
"set directory=~/.vim_swap//
"set backupdir=~/.vim_backup//
"set viewdir=~/.vim_views//
"set undodir=~/.vim_undo//

" map
imap jj <ESC>
nmap B ^
nmap E $

let mapleader=","
nmap <silent> <LEADER>ev :e $MYVIMRC<CR>
nmap <silent> <LEADER>sv :so $MYVIMRC<CR>

" plugins
nmap <C-e> :NERDTreeToggle<CR>
let NERDTreeIgnore=["\.git", "\.exe"]
let NERDTreeDirArrows=0
let NERDTreeQuitOnOpen=1
