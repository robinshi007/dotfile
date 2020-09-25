" === todos ===
" neovim plugins need python3.5+ and pip3 install neovim
" vim-plug > defx > fzf > coc > airline
" refer: https://github.com/kristijanhusak/neovim-config
"
"  === spec === {{{
"  for neovim only, not for vim
"  cross os, cross profile
"  os: win linux macos
"  profile: basic(text editor) advanced(ide: [syntax, indent, comment,
"  autocmd, auto-complete, format, linter ])
" }}}

" === setup === {{{
" neovim plugins need python3.5+ and `pip3 install --upgrade pynvim`
" `npm install -g eslint prettier
" }}}

" === environment === {{{
function! OSX()
  return has('macunix')
endfunction
function! LINUX()
  return has('unix') && !has('macunix') && !has('win32unix')
endfunction
function! WINDOWS()
  return  (has('win32') || has('win64'))
endfunction

set nocompatible     " must be the first line
if !WINDOWS()
  set shell=/bin/sh
endif
"if WINDOWS()         "  using '.vim' instead of 'vimfiles
"  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
"endif
" }}}

" === plugged plugins === {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif
call plug#begin($HOME.'/.config/nvim/plugged')
" basics
Plug 'tpope/vim-repeat'           " using . to repeat last action
Plug 'tpope/vim-surround'         " cs]<div>, cst', ds}, ysiw], yss)
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'kristijanhusak/defx-icons'
Plug 'manasthakur/vim-commentor'  " using gc to toggle
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'
Plug 'easymotion/vim-easymotion'
Plug 'osyo-manga/vim-anzu'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
" UI
if WINDOWS()
  Plug 'frankier/neovim-colors-solarized-truecolor-only'
else
  Plug 'altercation/vim-colors-solarized'
endif
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" languages
Plug 'editorconfig/editorconfig-vim'
Plug 'chr4/nginx.vim'
Plug 'plasticboy/vim-markdown'
Plug 'othree/html5.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
Plug 'jparise/vim-graphql'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'rust-lang/rust.vim'

" autocomplete, linter, formater
Plug 'neoclide/coc.nvim', { 'branch': 'release'}
" snip
Plug 'honza/vim-snippets'
call plug#end()
" }}}

" === basic === {{{
" general {{{
syntax enable
filetype indent on

set fileformats=unix,dos       " use unix then dos for reading file
set nomodeline                 " no modeline for safety
set novisualbell
set clipboard=unnamed
set nowrap                     " do not wrap long lines
set hidden                     " hiden files in background instead closing then
set autoread                   " auto re-read files if modified
set mouse=a                    " automatically enable mouse usage
set mousehide                  " hide mouse cursor when typing
set history=1000               " increase the undo limit
set backspace=indent,eol,start " allow backspacing over indention and line breaks
set iskeyword+=-
"}}}

" encodings {{{
" Stick with the UTF-8 encoding.
if has('multi_byte')
  " Encoding used in buffers, registers, strings in expressions
  set encoding=utf-8
  " Encoding used for the terminal.
  if empty(&termencoding)
    let &termencoding = &encoding
  endif
  " Encoding used for writing files.
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,gb18030,cp936,latin1
endif
"}}}

" indentation {{{
set autoindent
set smartindent
set smarttab
set tabstop=2     " ts  - show existing tab with 2 spaces width
set shiftwidth=2  " sw  - when indenting with '>', use 2 spaces width
set softtabstop=2 " sts - edit <tab> and <bs> keys to match tabstop
set expandtab     " - tabs are spaces
"}}}

" search {{{
set hlsearch
set incsearch
set ignorecase
set smartcase
"}}}

" folding {{{
" za zA zr zR zm zM zj zk
set nofoldenable      " disable folding by default
set foldmethod=indent " fold method: syntax, indent, marker
set foldlevel=10      " max fold level
set foldlevelstart=1  " auto fold when opening
set foldnestmax=3     " only fold up to three nested levels
"}}}

" user interface {{{
set number
set noshowmode                 " no show mode as similar function is in airline
set showcmd
set showmatch
set cursorline                 " highlight current line
set colorcolumn=80
set list
set listchars=tab:▸\ ,trail:·,precedes:←,extends:→,eol:↲,nbsp:␣
set laststatus=2
set scrolloff=1
set sidescrolloff=5

if exists('gui_running')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  "set guifont=Iosevka:h12
  "set guifontwide=
else
  set t_Co=256
endif
set background=dark
colorscheme solarized
"}}}

" swap/backup/view files {{{
set noswapfile
set nobackup
set nowritebackup
"}}}

" }}}

" === functions === {{{
function! StripTrailingWhitespace()
  normal mZ
  let l:chars = col("$")
  %s/\s\+$//e
  if (line("'Z") != line(".")) || (l:chars != col("$"))
    echo "Trailing whitespace stripped\n"
  endif
  normal `Z
endfunction
function! ToggleBG()
  let s:tbg = &background
  if s:tbg == "dark"
    set background=light
    let g:airline_solarized_bg='light'
  else
    set background=dark
    let g:airline_solarized_bg='dark'
  endif
endfunction
noremap <leader>bg :call ToggleBG()<CR>
noremap <leader>cb :call StripTrailingWhitespace()<CR>

" Function to source only if file exists {
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction

" Zoom/Restore window.
function! s:ZoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    execute t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <Leader>z :ZoomToggle<CR>

" }}}

" === key mappings === {{{
imap jk <ESC>
nmap B ^
nmap E $
nmap Y y$
nmap <SPACE> za
" move vertically by visual line
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]      " highlight last inserted text
vnoremap < <gv
vnoremap > >gv
" WINDOWS
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
" keep search result at the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
" buffer switch
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>

let mapleader=","
nmap <LEADER>a ggVG"
nmap <LEADER>v V`}
vnoremap <LEADER>y "+y   " copy to system clipboard
nmap <LEADER><LEADER> <C-^>
nmap <silent> <LEADER>ev :e $MYVIMRC<CR>
nmap <silent> <LEADER>sv :source $MYVIMRC \|echom 'NeoVim config reloaded'<CR>
nmap <LEADER>es :sp %%
nmap <LEADER>l :set list!<CR>
nmap <LEADER>ss :mksession<CR>
nmap <LEADER>tw :call StripTrailingWhitespace()<CR>
nmap <LEADER>hl :set hls!<CR>

" :ls to list all buffers
noremap <TAB> :bnext!<CR>
noremap <S-TAB> :bprev!<CR>
" close all buffers except this one
noremap <LEADER>bd :%bd\|e#<CR>
" }}}

" === plugins === {{{
runtime! partials/defx.vim
runtime! partials/fzf.vim
runtime! partials/coc.vim
"runtime! partials/ale.vim
" gitgutter {{{
let g:gitgutter_max_signs=1000
" }}}
" Vim Easy Align {{{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}}
" indentLine {{{
let g:indentLine_enabled=1
let g:indentLine_char_list = ['¦', '┆', '┊']
let g:indentLine_color_term=239
" }}}
" easy motion {{{
" s{char}{char} to move to {char}{char}
map s <Plug>(easymotion-overwin-f2)
" Move to line
map <LEADER>L <Plug>(easymotion-bd-jk)
nmap <LEADER>L <Plug>(easymotion-overwin-line)
"  Move to word
map  <LEADER>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
" }}}
" vim-anzu {{{
" clean highlight using `:nohl`
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
" }}}
" ctrlsf {{{
" go to next match using <C-J> or <C-K>
nmap <LEADER>f <Plug>CtrlSFPrompt
nmap <LEADER>F <Plug>CtrlSFCwordPath
vmap <LEADER>F <Plug>CtrlSFVwordPath
nmap <LEADER>ft :CtrlSFToggle<CR>
let g:ctrlsf_auto_close=0
" }}}

" airline {{{
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#ale#enabled=1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
" }}}
" === languages === {{{
" vim
autocmd FileType vim setlocal foldmethod=marker matchpairs-=":"
" python
au BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79
" sh
autocmd BufWritePre *.sh call StripTrailingWhitespace()
" golang
let g:go_fmt_command = 'goimports'    "Auto import go packages on save
autocmd Filetype go setlocal tabstop=2 shiftwidth=2 softtabstop=4
" markdown
autocmd FileType markdown setlocal wrap matchpairs+=<:>
" scss
au BufRead,BufNewFile *.scss set filetype=scss.css
" html
au  FileType html,xml setlocal matchpairs+=<:>
" }}}

" === local config === {{{
call SourceIfExists("~/nvim.local")
" }}}
