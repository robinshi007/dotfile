" === plugins ===
" Theme {{{
set background=dark
let g:solarized_contrast="high"
let g:solarized_termcolors=16
colorscheme solarized
" }}}
" NERDTree {{{
nmap <C-e> :NERDTreeToggle<CR>
let NERDTreeIgnore=["\.git", "\.exe"]
let NERDTreeDirArrows=0
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
" }}}
" NERDCommenter {{{
" <leader>c<space>
nmap <silent> gc <LEADER>c<SPACE>
vmap <silent> gc <LEADER>c<SPACE>
" <leader>cc
" <leader>cu
" }}}
" Vim Easy Align {{{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}}
" indentLine {{{
let g:indentLine_enabled=1
let g:indentLine_char = "⟩"
let g:indentLine_color_term=239
" }}}
" Easymotion {{{
" <leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
map s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
"  Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
" }}}
" Neovim-fuzzy {{{
nnoremap <C-p> :FuzzyOpen<CR>
" }}}
" Airline {{{
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
" }}}
" Deoplete  {{{
set completeopt+=noselect
set completeopt-=preview
let g:deoplete#enable_at_startup=1
let g:deoplete#auto_complete_delay=50
let g:deoplete#enable_ignore_case=0
let g:deoplete#enable_camel_case=0
let g:deoplete#enable_smart_case=1
let g:deoplete#enable_refresh_always=0
let g:deoplete#max_list=20

let g:deoplete#sources#go#gocode_binary=$GOPATH.'/bin/gocode'
let g:deoplete#sources#jedi#server_timeout=20

"let g:racer_cmd=$HOME.'/.cargo/bin/racer'
let g:deoplete#sources#rust#racer_binary=$HOME.'/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path=$HOME.'/projects/rust/src'
let g:deoplete#sources#rust#documentation_max_height=20

augroup rust-mapping
  autocmd!
  autocmd filetype rust nmap <buffer> gd <plug>DeopleteRustGoToDefinitionDefault
  autocmd filetype rust nmap <buffer> K  <plug>DeopleteRustShowDocumentation
augroup end
" }}}
" neosnippet {{{
imap <c-k> <Plug><neosnippet_expand_or_jump)
smap <c-k> <Plug><neosnippet_expand_or_jump)
xmap <c-k> <Plug><neosnippet_expand_target)

imap <expr><TAB> pumvisible() ?
  \ "\<C-n>" :neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
let g:neosnippet#snippets_directory='~/.config/nvim/plugged/neosnippet-snippets/neosnippets'
" }}}
