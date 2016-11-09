#!/bin/bash

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
'tmux.conf'
)

echo "=> starting"
for i in ${FILES[@]}; do
  if $(is_dir_file $i);then
    if [ -L "$HOME/.$i" ];then
      echo "File link exist: $HOME/.$i"
      exit 1
    fi
    if $(is_dir_file "$HOME/.$i") ;then
      if $(is_dir_file "$HOME/.$i.bak") ;then
        echo "File backup exist: $HOME/.$i.bak"
        exit 1
      fi
      echo "File moves: $i => .$i.bak"
      mv "$HOME/.$i" "$HOME/.$i.bak"
    fi
    echo "File linking: $HOME/.$i => $i"
    ln -s $HOME/dotfiles/$i $HOME/.$i
  fi
done
echo "=> end" 
