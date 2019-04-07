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
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
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
" Tagbar {{{
nmap <F8> :TagbarToggle<CR>
" }}}
" Airline {{{
let g:airline_powerline_fonts=1
let g:airline_left_sep=""
let g:airline_right_sep=""
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#ale#enabled=1
let g:airline#extensions#ale#error_symbol='E:'
let g:airline#extensions#ale#warning_symbol='W:'
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
" }}}
" Vimgutter {{{
let g:gitgutter_override_sign_column_highlight=0
let g:gitgutter_map_keys=0
" }}}
" NCM2 {{{
autocmd BufEnter * call ncm2#enable_for_buffer()
autocmd User Ncm2PopupOpen  set completeopt=menuone,noselect,noinsert
autocmd User Ncm2PopupClose set completeopt=menuone
let ncm2#popup_delay=5
let ncm2#complete_length=[[1,1]]
let g:ncm2#matcher='substrfuzzy'
set pumheight=5
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent> <expr> <CR>
      \pumvisible() ?
      \(!empty(v:completed_item) ?
      \ncm2_ultisnips#expand_or("", 'n') :
      \"\<CR>\<C-r>=AutoPairsReturn()\<CR>") :
      \"\<CR>\<C-r>=AutoPairsReturn()\<CR>" :
" }}}
" Ale {{{
let g:ale_lint_on_enter=0
let g:ale_lint_on_text_changed='never'
let g:ale_echo_msg_error_str='E'
let g:ale_echo_msg_warning_str='W'
let g:ale_echo_msg_format='[%linter%] %s [%severity]'
let g:ale_linter={
      \'python':['flake8']
      \}
" }}}
" Ultisnips {{{
" use Alt+q to expand, Alt+w to forward and Alt+e to backward
inoremap <expr> <A-q> ncm2_ultisnips#expand_or("\<Plug>(ultisnips_expand)", 'm')
snoremap <A-q> <Plug>(ultisnips_expand)
let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger = "<a-w>"
let g:UltiSnipsJumpBackwardTrigger = "<a-e>"
let g:UltiSnipsRemoveSelectModeMappings=0
" }}}
" CompleteParameter {{{
let g:complete_parameter_use_ultisnips_mapping=1
" }}}
" MeoFormat {{{
let g:neoformat_basic_format_align=1 " enable alignment
let g:neoformat_basic_format_retab=1 " enable tab to space conversion
let g:neoformat_basic_format_trim=1  " enable trimming of trailing whitespace
let g:neoformat_only_msg_on_error=1
" }}}
