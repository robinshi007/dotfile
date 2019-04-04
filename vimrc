" RTF
" go to last edit: gi OR `.
" go to older in change list: g;
" go to newer in change list: g,
" go to older/newer in jump list: ctrl+o/ctrl+i

set nocompatible

call plug#begin($HOME.'/.vim/plugged')
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'yggdroot/indentLine'
Plug 'ervandew/supertab'
Plug 'kien/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'easymotion/vim-easymotion'

" files
Plug 'chr4/nginx.vim'
Plug 'elzr/vim-json'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'

Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'


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
set smartindent
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
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

" autogroup
augroup javascript
  autocmd!
  autocmd BufRead .babelrc,.eslintrc,.tslintrc  set filetype=json
  autocmd FileType javascript setlocal foldmethod=syntax
  autocmd FileType javascript setlocal formatprg=prettier\ --stdin
  autocmd BufWritePre *.js    :normal gggqG
  "autocmd BufWritePre *.js    exe "normal! gggqG\<C-o><C-o>"
augroup END
augroup css
  autocmd!
  autocmd FileType css, scss setlocal iskeyword+=-
augroup END

" key mapping
imap jj <ESC>
nmap B ^
nmap E $
let mapleader=","
nmap <silent> <LEADER>ev :e $MYVIMRC<CR>
nmap <silent> <LEADER>sv :so $MYVIMRC<CR>
nmap <silent> <LEADER>h :set hlsearch!<CR>
" window
" <C-w>s
" <C-w>v
" <C-w>w   " move to next window
" <C-w>H   " move left
" <C-w>L   " move right
" <C-w>J   " move down 
" <C-w>K   " move up
" <C-w>=   " same height
" <C-w>+   " adding height
" <C-w>-   " removing height

" plugins
" === NERDTree ===
nmap <C-e> :NERDTreeToggle<CR>
let NERDTreeIgnore=["\.git", "\.exe"]
let NERDTreeDirArrows=0
let NERDTreeQuitOnOpen=1
" === NERDCommenter ===
" <leader>c<space>
nmap <silent> gc <LEADER>c<SPACE> " toggle comment in normal mode
vmap <silent> gc <LEADER>c<SPACE>
" <leader>cc
" <leader>cu
" === ctrlp ===
let g:ctrlp_map='<C-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_custom_ignore= {
      \ 'dir': '\v[\/](\.(git|hg|svn)|node_modules)$',
      \ 'file': '\v\.(exe|dll|zip)$',
      \}
" go to buffer by <C-p> then <C-f>

" === supertab ===
let g:SuperTabDefaultCompletionType='context'
" == easymotion ===
"<leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
"
"" s{char}{char} to move to {char}{char}
map s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
"
" " Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
