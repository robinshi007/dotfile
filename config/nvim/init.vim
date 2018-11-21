" neovim plugins need python3.5+ and pip3 install neovim
"
if &compatible
  set nocompatible
end

" === plugged plugins ===
call plug#begin($HOME.'/.config/nvim/plugged')
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'easymotion/vim-easymotion'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" language
Plug 'vim-syntastic/syntastic'
Plug 'chr4/nginx.vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'rust-lang/rust.vim'

Plug 'Shougo/deoplete.nvim',  { 'do': ':UpdateRemotePlugins '}
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'zchee/deoplete-go',  { 'do': 'make'}
Plug 'zchee/deoplete-jedi'
Plug 'sebastianmarkow/deoplete-rust'

call plug#end()

" === modules ===
"for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
"  exec 'source' f
"endfor
"
source ~/.config/nvim/config/base.vim
source ~/.config/nvim/config/functions.vim
source ~/.config/nvim/config/keymappings.vim
source ~/.config/nvim/config/plugins.vim


