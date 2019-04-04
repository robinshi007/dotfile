# 1. setup the sources.list to "mirrors.163.com"

# 2. install tools
# git tmux vim neovim fzy 
# install neovom
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo apt update
sudo apt install neovim -y
sudo apt install python3-dev python3-pip -y

RIPGREP_DEB="ripgrep_0.10.0_amd64.deb"
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/$RIPGREP_DEB
sudo dpkg -i $RIPGREP_DEB
rm $RIPGREP_DEB

sudo apt install fzy

# 3. install docker + systemd init scripts

# 4. git sync/update

