#!/bin/bash

# setup exe
# brew install tmux neovim python3 ag reattach-to-user-namespace
# brew cask install iterm2

# check path exist or mkdir for it
[ -d vim/autoload ] ||         mkdir -p vim/autoload
[ -d config/nvim/autoload ] || mkdir config/nvim/autoload

# download plug.vim to autoload path
cd vim/autoload/ &&          { curl -O https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; cd -;}
cd config/nvim/autoload/ &&  { curl -O https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; cd -;}

function is_dir_file(){
  if [[ -f $1 ]] || [[ -d $1 ]];then
    return 0
  else
    return 1
  fi
}

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
