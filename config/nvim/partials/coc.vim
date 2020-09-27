" coc {{{
set completeopt-=preview       "Disable preview window for autocompletion
set pumheight=15               "Maximum number of entries in autocomplete popup

augroup vimrc_autocomplete
  autocmd CursorHold * silent call CocActionAsync('highlight')
  autocmd CursorHoldI * call CocActionAsync('showSignatureHelp')
augroup END

let g:coc_user_config = {
      \ 'javascript.suggestionActions.enabled': v:false,
      \ 'prettier.printWidth': 100,
      \ 'prettier.singleQuote': v:true,
      \ 'diagnostic.errorSign': '✖',
      \ 'diagnostic.infoSign': '>>',
      \ 'diagnostic.hintSign': '>',
      \ }

let g:coc_global_extensions = [
      \ 'coc-css',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-prettier',
      \ 'coc-tsserver',
      \ 'coc-snippets',
      \ 'coc-vimlsp',
      \ 'coc-python',
      \ 'coc-go',
      \ ]
let s:snippets = {}
function s:snippets_check() abort
  let word = matchlist(getline('.')[0:(col('.') - 1)], '\k*$')
  if !empty(word[0]) && has_key(s:snippets, word[0])
    return word[0]
  endif
  return ''
endfunction

function! s:snippets_expand(word) abort
  return "\<C-w>".s:snippets[a:word]
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function s:tab_completion() abort
  let snippet = s:snippets_check()
  if !empty(snippet)
    return s:snippets_expand(snippet)
  endif
  if pumvisible()
    return "\<C-n>"
  endif
  if s:check_back_space()
    return "\<TAB>"
  endif
  return coc#refresh()
endfunction

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

imap <silent><expr> <TAB> <SID>tab_completion()
"inoremap <slient><expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Remap keys for gotos
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>ge <Plug>(coc-declaration)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
" format
vmap <leader>gf <Plug>(coc-format-selected)
nmap <leader>gf <Plug>(coc-format-selected)
nmap <leader>gF <Plug>(coc-format)
" rename & show help
nmap <leader>rn <Plug>(coc-rename)
nmap <silent><leader>gh :call <SID>show_documentation()<CR>
nmap <leader>cq <Plug>(coc-fix-current)
vmap <leader>ca <Plug>(coc-codeaction-selected)
nmap <leader>ca <Plug>(coc-codeaction-selected)
" Use `[c` and `]c` to navigate diagnostics
" nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
" nnoremap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent>[g :call CocAction('diagnosticPrevious')<CR>
nnoremap <silent>]g :call CocAction('diagnosticNext')<CR>
" list all command available
nnoremap <leader>cc :<C-u>CocList commands<CR>
" list errors
nnoremap <leader>cl :<C-u>CocDiagnostics<CR>
" restart tsserver
nnoremap <silent><leader>cR :<C-u>CocRestart<CR>
" manage extensions
nnoremap <leader>cx :<C-u>CocList extensions<CR>
" Find symbol of current document
 nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
" " Search workspace symbols
 nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>

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
