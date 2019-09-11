" === todos ===
" neovim plugins need python3.5+ and pip3 install neovim
" vim-plug > nerdtree > fzf > ncm2 > ale > neoformat > airline
" refer: https://github.com/kristijanhusak/neovim-config
"
"  === spec === {{{
"  for neovim only, not for vim
"  cross os, cross profile
"  os: win linux macos
"  profile: basic(text editor) advanced(ide: [syntax, indent, comment,
"  autocmd, auto-complete, format, linter ])
"
"  only one config file for simplification
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
call plug#begin($HOME.'/.config/nvim/plugged')
" basics
Plug 'tpope/vim-repeat'           " using . to repeat last action
Plug 'tpope/vim-surround'         " cs]<div>, cst', ds}, ysiw], yss)
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugin' }
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
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'rust-lang/rust.vim'

" autocomplete
Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile'}
" linter, fixer
Plug 'w0rp/ale'
" formater
Plug 'sbdchd/neoformat'
" snip
Plug 'honza/vim-snippets'
call plug#end()
" }}}

" === basic === {{{
" general {{{
syntax enable
filetype indent on

set fileformats=unix,dos       " use unix for new files
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
nmap <silent> <LEADER>sv :source $MYVIMRC<CR>
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
" defx {{{
augroup vimrc_defx
  autocmd!
  autocmd FileType defx call s:defx_mappings()        " Defx mappingsjj
  autocmd VimEnter * call s:setup_defx()
augroup END
"nnoremap <silent><C-e> :call <sid>defx_open({ 'split': v:true })<CR>
"nnoremap <silent><LEADER>hf :call <sid>defx_open({ 'split': v:true, 'find_current_file': v:true })<CR>
nnoremap <silent><C-e> :call <sid>defx_open({ 'split': v:true, 'find_current_file': v:true })<CR>
let s:default_columns = 'indent:git:icon:filename'

function! s:setup_defx() abort
  call defx#custom#option('_', {
        \ 'columns': s:default_columns,
        \ 'show_ignored_files': 1,
        \ 'toggle': 1,
        \ 'resume': 1,
        \ })

  call defx#custom#column('filename', {
        \ 'min_width': 30,
        \ 'max_width': 30,
        \ })

  call s:defx_open({ 'dir': expand('<afile>') })
endfunction

function! s:get_project_root() abort
  let l:git_root = ''
  let l:path = expand('%:p:h')
  let l:cmd = systemlist('cd '.l:path.' && git rev-parse --show-toplevel')
  if !v:shell_error && !empty(l:cmd)
    let l:git_root = fnamemodify(l:cmd[0], ':p:h')
  endif

  if !empty(l:git_root)
    return l:git_root
  endif

  return getcwd()
endfunction

function! s:defx_open(...) abort
  let l:opts = get(a:, 1, {})
  let l:path = get(l:opts, 'dir', s:get_project_root())

  if !isdirectory(l:path) || &filetype ==? 'defx'
    return
  endif

  let l:args = '-winwidth=42 -direction=topleft'

  if has_key(l:opts, 'split')
    let l:args .= ' -split=vertical'
  endif

  if has_key(l:opts, 'find_current_file')
    if &filetype ==? 'defx'
      return
    endif
    call execute(printf('Defx %s -search=%s %s', l:args, expand('%:p'), l:path))
  else
    call execute(printf('Defx -toggle %s %s', l:args, l:path))
    call execute('wincmd p')
  endif

  return execute("norm!\<C-w>=")
endfunction

function! s:defx_context_menu() abort
  let l:actions = ['new_multiple_files', 'rename', 'copy', 'move', 'paste', 'remove']
  let l:selection = confirm('Action?', "&Add file/directory\n&Rename\n&Copy\n&Move\n&Paste\n&Delete")
  silent exe 'redraw'

  return feedkeys(defx#do_action(l:actions[l:selection - 1]))
endfunction

function! s:defx_toggle_tree() abort
  if defx#is_directory()
    return defx#do_action('open_or_close_tree')
  endif
  return defx#do_action('drop')
endfunction

function! s:defx_mappings() abort
  nnoremap <silent><buffer>m :call <sid>defx_context_menu()<CR>
  nnoremap <silent><buffer><expr> o <sid>defx_toggle_tree()
  nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> <CR> <sid>defx_toggle_tree()
  nnoremap <silent><buffer><expr> C defx#is_directory() ? defx#do_action('multi', ['open', 'change_vim_cwd']) : 'C'
  nnoremap <silent><buffer><expr> s defx#do_action('open', 'botright vsplit')
  nnoremap <silent><buffer><expr> R defx#do_action('redraw')
  nnoremap <silent><buffer><expr> U defx#do_action('multi', [['cd', '..'], 'change_vim_cwd'])
  nnoremap <silent><buffer><expr> H defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer> J :call search('')<CR>
  nnoremap <silent><buffer> K :call search('', 'b')<CR>
  nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> q defx#do_action('quit')
  nnoremap <silent><buffer><expr> tt defx#do_action("toggle_columns", "'.s:default_columns.':size")
endfunction
" }}}
" gitgutter {{{
let g:gitgutter_max_signs=1000
" }}}
" fzf {{{
if WINDOWS()
  let $FZF_DEFAULT_OPTS=' --no-height'
else
  let $FZF_DEFAULT_OPTS='--height 30% --layout=reverse --border --color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254 --color info:254,prompt:37,spinner:108,pointer:235,marker:235'
endif
let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" --glob "!node_modules/*"'
nnoremap <C-p> :Files<CR>
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
" coc {{{
set completeopt-=preview      "Disable preview window for autocompletion
set pumheight=15               "Maximum number of entries in autocomplete popup

augroup vimrc_autocomplete
  autocmd CursorHold * silent call CocActionAsync('highlight')
  autocmd CursorHoldI * call CocActionAsync('showSignatureHelp')
augroup END

let g:coc_user_config = {
      \ 'diagnostic.enable': v:false,
      \ 'prettier.printWidth': 100,
      \ 'prettier.singleQuote': v:true,
      \ }

let g:coc_global_extensions = [
      \ 'coc-css',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-pyls',
      \ 'coc-prettier',
      \ 'coc-tsserver',
      \ 'coc-snippets',
      \ 'coc-vimlsp',
      \ 'coc-rls',
      \ 'coc-go',
      \ ]

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
imap <expr> <CR> pumvisible() ? "\<C-y>" : "\<Plug>delimitMateCR"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
vmap <leader>lf <Plug>(coc-format-selected)
nmap <leader>lf <Plug>(coc-format-selected)
nmap <leader>lF <Plug>(coc-format)
nmap <leader>ld <Plug>(coc-definition)
nmap <leader>lc <Plug>(coc-declaration)
nmap <leader>lg <Plug>(coc-implementation)
nmap <leader>lu <Plug>(coc-references)
nmap <leader>lr <Plug>(coc-rename)
nmap <leader>lq <Plug>(coc-fix-current)
nmap <silent><leader>lh :call CocAction('doHover')<CR>
vmap <leader>la <Plug>(coc-codeaction-selected)
nmap <leader>la <Plug>(coc-codeaction-selected)
inoremap <silent><C-Space> <C-x><C-o>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"set wildoptions=pum
set wildignore=*.o,*.obj,*~                                                     "stuff to ignore when tab completing
set wildignore+=*.git*
set wildignore+=.pyc,.swp
set wildignore+=*sass-cache*
set wildignore+=*__pycache__*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules*
set wildignore+=*DS_Store*
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
" }}}
" ale {{{
" Check Python files with flake8 and pylint.
"let g:ale_sign_column_always=1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_error_str='E'
let g:ale_echo_msg_warning_str='W'
let g:ale_echo_msg_format='[%linter%] %s [%severity%]'
let g:ale_lint_delay=1000
let g:ale_open_list=0
"let g:ale_completion_enabled=1
"let g:ale_linters_explicit=1
let g:ale_lint_on_enter=0
let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_save=1
"let g:ale_fix_on_save=1
" use quickfix list instead of the loclist
"let g:ale_set_loclist=0
"let g:ale_set_quickfix=1

let b:ale_linters = {
      \ 'python': ['pyls', 'flake8'],
      \ 'javascript': ['eslint'],
      \ 'go': ['golint','go vet'],
      \ 'rust': ['rls'],
      \}
let b:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'python': ['autopep8', 'yapf'],
      \ 'rust': ['rustfmt'],
      \}
let g:ale_python_pyls_use_global=1
let g:ale_rust_rls_toolchain='stable'
nmap ]a <Plug>(ale_next_wrap)
nmap [a <Plug>(ale_previous_wrap)
nmap <leader>d <Plug>(ale_fix)
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
