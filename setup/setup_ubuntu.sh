# 1. setup the sources.list to "mirrors.aliyun.com"
#sudo sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g"  /etc/apt/sources.list
#sudo sed -i "s/security.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list

# 2. install tools
# git tmux vim neovim fzy
# install neovom
sudo apt update
sudo apt autoremove -y
sudo apt install software-properties-common -y
if ! type nvim &>/dev/null;then
  sudo add-apt-repository ppa:neovim-ppa/unstable -y
  sudo apt update
  sudo apt install tmux vim git neovim fzy -y
  sudo apt install python3-dev python3-pip -y
  if ! type rg &>/dev/null;then
    RIPGREP_DEB="ripgrep_13.0.0_amd64.deb"
    curl -LO https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/$RIPGREP_DEB
    sudo dpkg -i $RIPGREP_DEB
    rm $RIPGREP_DEB
  fi
fi

# 3. install runtime(docker, golang, node, python3 and others)
# node and npm
if ! type node &>/dev/null;then
  echo "=> installing nodejs"
  curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  sudo apt install -y nodejs
fi
