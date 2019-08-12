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
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'editorconfig/editorconfig-vim'
" UI
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" languages
Plug 'chr4/nginx.vim'
Plug 'plasticboy/vim-markdown'
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'       "for highlight javascript
Plug 'HerringtonDarkholme/yats.vim'  "for highlight typescript
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'

if has('unix')
  let s:uname=substitute(system('uname -s'), '\n', '','')
  if s:uname == "Darwin"
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
    Plug 'rust-lang/rust.vim'

    Plug 'vim-syntastic/syntastic'

    " snippets
    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'

    " complete
    Plug 'Shougo/deoplete.nvim',  { 'do': ':UpdateRemotePlugins '}
    Plug 'zchee/deoplete-go',     { 'do': 'make'}
    Plug 'mhartington/nvim-typescript',     { 'do': './install.sh'}
    Plug 'zchee/deoplete-jedi'
    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern'}
    Plug 'sebastianmarkow/deoplete-rust'
    " after install deoplete plugin, do :PlugInstall and :UpdateRemotePlugins
  elseif s:uname == "Linux"
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
  endif
endif
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


