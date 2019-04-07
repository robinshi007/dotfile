" neovim plugins need python3.5+ and pip3 install neovim
" vim-plug > ncm2 > ale > neoformat > solarized > airline >
if &compatible
  set nocompatible
end

" === plugged plugins ===
call plug#begin($HOME.'/.config/nvim/plugged')
" basics
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'
Plug 'easymotion/vim-easymotion'
Plug 'cloudhead/neovim-fuzzy'
Plug 'majutsushi/tagbar'
" UI
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" languages
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'chr4/nginx.vim'
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'mxw/vim-jsx'
"Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
"Plug 'rust-lang/rust.vim'

" autocomplete
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-ultisnips'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-bufword'

Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-tern', {'do': 'sudo npm install'}
Plug 'ncm2/ncm2-cssomni'
" linter, syntax check
Plug 'w0rp/ale'
" formater
Plug 'sbdchd/neoformat'
" ncm2 snip
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tenfyzhong/CompleteParameter.vim'
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
source ~/.config/nvim/config/autogroup.vim


