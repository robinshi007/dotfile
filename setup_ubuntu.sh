# 1. setup the sources.list to "mirrors.aliyun.com"
sudo sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g"  /etc/apt/sources.list
sudo sed -i "s/security.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list

# 2. install tools
# git tmux vim neovim fzy 
# install neovom
sudo apt update
sudo apt autoremove -y
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo apt update
sudo apt install git neovim vim fzy -y
sudo apt install python-pip python-dev python3-dev python3-pip -y
if ! type rg &>/dev/null;then
  RIPGREP_DEB="ripgrep_0.10.0_amd64.deb"
  curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/$RIPGREP_DEB
  sudo dpkg -i $RIPGREP_DEB
  rm $RIPGREP_DEB
fi

# 3. install runtime
# node and npm
if ! type node &>/dev/null;then
  echo "=> installing nodejs"
  curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
  sudo apt install -y nodejs
fi

if ! type go &>/dev/null;then
  GOLANG_VERSION="1.12.linux-amd64"
  echo "=> installing go"
  cd ~/tmp
  curl -O https://dl.google.com/go/go$GOLANG_VERSION.tar.gz

  if [ -d /usr/local/go ];then
    if [ -d /usr/local/go_bak ];then
      sudo rm -rf /usr/local/go_bak
    fi
    sudo mv /usr/local/go /usr/local/go_bak
  fi
  tar xf go$GOLANG_VERSION.tar.gz
  sudo chown -R root:root ~/tmp/go
  sudo mv go /usr/local
  cd -
fi

# 4. install docker + systemd init scripts

# 5. git sync/update

