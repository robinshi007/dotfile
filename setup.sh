#!/bin/bash

OS_NAME=$(uname -s)
# === functions
function is_dir_file(){
  if [[ -f $1 ]] || [[ -d $1 ]];then
    return 0
  else
    return 1
  fi
}
function mkfolder(){
  if [ ! -d $1 ];then
    echo "=> mkfolder $1"
    mkdir -p $1
  fi
}

# === setup folders and files
mkfolder "$HOME/bin"
mkfolder "$HOME/tmp"
[ -d vim/autoload ] ||         mkdir -p vim/autoload
[ -d config/nvim/autoload ] || mkdir -p config/nvim/autoload
# download plug.vim to autoload path
PLUG_VIM_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
[ -f vim/autoload/plug.vim ] || ( cd vim/autoload/ && { curl -O $PLUG_VIM_URL; cd -;} )
[ -f config/nvim/autoload/plug.vim ] || ( cd config/nvim/autoload/ &&  { curl -O $PLUG_VIM_URL; cd -;} )

# ==== install basic packages

if [ $OS_NAME == "Linux" ];then
  # setup debian/ubuntu
  echo "=> installing linux packages"
  source setup_ubuntu.sh
elif [ $OS_NAME == "Darwin" ];then
  echo "=> installing macos packages"
  # setup macos
  # brew install tmux neovim python3 ag reattach-to-user-namespace
  # brew cask install iterm2
fi

# == link dotfiles
FILES=(
'bashrc'
'profile'
'dircolors'
'vimrc'
'vim'
'gitconfig'
'gitignore'
'config'
'tmux.conf'
'tern-config'
'eslintrc.json'
)

# link dotfiles to $HOME
echo "=> link dotfiles starting"
for i in ${FILES[@]}; do
  if $(is_dir_file $i);then
    if [ -L "$HOME/.$i" ];then
      echo "File link exist: $HOME/.$i"
      continue
    fi
    if $(is_dir_file "$HOME/.$i") ;then
      if $(is_dir_file "$HOME/.$i.bak") ;then
        echo "File backup exist: $HOME/.$i.bak"
        continue
      fi
      echo "File moves: $i => .$i.bak"
      mv "$HOME/.$i" "$HOME/.$i.bak"
    fi
    echo "File linking: $HOME/.$i => $i"
    ln -s $HOME/dotfile/$i $HOME/.$i
  fi
done

echo "=> end"
