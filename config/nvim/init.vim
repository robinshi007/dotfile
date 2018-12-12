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
Plug 'cloudhead/neovim-fuzzy'
Plug 'editorconfig/editorconfig-vim'

" language
Plug 'vim-syntastic/syntastic'
Plug 'chr4/nginx.vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'rust-lang/rust.vim'

" snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" complete
Plug 'Shougo/deoplete.nvim',  { 'do': ':UpdateRemotePlugins '}
Plug 'zchee/deoplete-go',  { 'do': 'make'}
Plug 'zchee/deoplete-jedi'
Plug 'sebastianmarkow/deoplete-rust'

" backup plugins
"Plug 'airblade/vim-gitgutter'
"Plug 'w0rp/ale'

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

" === local config ===

