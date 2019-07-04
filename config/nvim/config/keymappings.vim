" map
imap jj <ESC>
nmap B ^
nmap E $

let mapleader=","
nmap <LEADER><LEADER> <C-^>
nmap <silent> <LEADER>ev :e $MYVIMRC<CR>
nmap <silent> <LEADER>sv :so $MYVIMRC<CR>
nmap <LEADER>tw :call StripTrailingWhitespace()<CR>

" buffers
" :ls to list all buffers
noremap <TAB> :bnext!<CR>
noremap <S-TAB> :bprev!<CR>
" close all buffers except this one
noremap <LEADER>bd :%bd\|e#<CR>

