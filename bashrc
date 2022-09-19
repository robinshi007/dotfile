# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# == opts
export HISTCONTROL=ignoreboth
export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTTIMEFORMAT="%d/%m/%y %T "
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
# append to the history file, don't overwrite it
shopt -s histappend
# check the window size after each command and, if necessary,
shopt -s checkwinsize
# case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob
# autocorrect typos in path names when using `cd`
shopt -s cdspell
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/qux`
# * recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2>/dev/null
done

# == alias
alias reload='source ~/.bashrc'
alias ll='ls -lh'
alias la='ls -Ah'   # show hidden
alias lla='ls -Alh'
alias ..='cd ..'
alias ...='cd ...'
alias md='mkdir -p'
alias cls='clear'
# alias python='python3'

# == export
export LC_ALL="en_US.utf-8"
export LANG="en_US"
export EDITOR='vim'
export OS_NAME=$(uname -s)
export GO111MODULE=on
# disable chsh -s /bin/zsh warning message
export BASH_SILENCE_DEPRECATION_WARNING=1

# == dircolor
if [ $OS_NAME == "Linux" ];then
  eval "$(dircolors -b ~/.dircolors)"
  alias ls='ls --color=auto'
elif [ $OS_NAME == "Darwin" ];then
  eval "$(gdircolors -b ~/.dircolors)"
  #alias ls='ls -FHG'
  alias ls='ls -F --show-control-chars --color=auto'
fi
if [ $OS_NAME == "Linux" ] || [ $OS_NAME == "Darwin" ];then
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# apt install ncurses-term
if [ -e /usr/share/terminfo/x/xterm+256color ] || [ -e /lib/terminfo/x/xterm+256color ] || [ $OS_NAME == 'Darwin' ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

# == prompt colors
RESET=$(tput setaf 7)
YELLOW=$(tput setaf 3)
RED=$(tput setaf 1)
MAGENTA=$(tput setaf 5)
BLUE=$(tput setaf 4)
CYAN=$(tput setaf 6)
GREEN=$(tput setaf 2)
BLACK=$(tput setaf 2)
BLACK=$(tput setaf 0)
WHITE=$(tput setaf 7)
ORANGE=$(tput setaf 3)
HAPPY_CHAR=":)"
UNHAPPY_CHAR=":("

style_reset="\[${RESET}\]"
style_user="\[${RESET}${ORANGE}\]"
style_host="\[${RESET}${YELLOW}\]"
style_path="\[${RESET}${GREEN}\]"
style_char="\[${RESET}\]"
style_branch="\[${CYAN}\]"
style_smily="\[${GREEN}\]"
style_smily_alt="\[${RED}\]"

function prompt_smily()
{
    if [[ "$1" -eq 0 ]];then
	echo -ne "${style_smily}${HAPPY_CHAR}"
    else
	echo -ne "${style_smily_alt}${UNHAPPY_CHAR}"
    fi
}
# Git status.
# Adapted from: https://github.com/cowboy/dotfiles/
function prompt_git() {
  local output
  output="$(git branch 2>/dev/null | grep '^*' | tr -d '* ' | tr -d '\n')"
  if [ -z "$output" ];then
    echo -ne ""
  else
    echo -ne "($output)"
  fi
}
function set_bash_prompt()
{
  local exit_status="$?"
    PS1=""
    PS1+="${style_reset}[${style_user}\u"
    PS1+="${style_char}: "
    PS1+="${style_path}\w${style_reset}]"
    PS1+="${style_branch}$(prompt_git)${style_reset}" # Git details
    PS1+="$(prompt_smily $exit_status)"
    PS1+="${style_char}\$${style_reset}"
    PS2="> "
    PS3="> "
    PS4="+ "
}
PROMPT_COMMAND=set_bash_prompt

# == functions
ips()
{
  sudo ifconfig | grep "inet " | awk '{ print $2}'
}
# test on macos
port_used(){
  if [[ -n "$1" ]];then
    echo $(sudo lsof -nP -iTCP:$1 | grep LISTEN)
  else
    echo "please provide the port number"
  fi
}
docker_ip(){
  echo $(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+')
}

mkcd()
{
    mkdir -p "$1"
    cd "$1"
}
# git checkout next commit
function gcn() {
  git log --reverse --pretty=%H master | grep -A 1 $(git rev-parse HEAD) | tail -n1 | xargs git checkout
}
# git checkout previouscommit
function gcp() {
  git checkout HEAD^1
}
# git diff last two commits
function gdl(){
  git diff HEAD^1..HEAD
}
# git shortlog --summary
function gsl(){
  git shortlog -s -n
}
# git log one line
function gll(){
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
}
# == PATH
if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ]; then
    export PATH="$HOME/.local/bin:$PATH"
fi
# for mac os
if [ $OS_NAME == "Darwin" ];then
  if [ -d "/usr/local/opt/coreutils/libexec/gnubin" ];then
    export PATH="/usr/local/opt/coreutils/libexec/gnubin":$PATH
  fi
  export PATH="$HOME/Library/Python/3.7/bin":$PATH
  ulimit -n 10000  # for limit of file descriptors
fi
if [ -d "$HOME/.cargo/bin" ]; then
    . "$HOME/.cargo/env"
    export PATH="$HOME/.cargo/bin:$PATH"
fi
if [[ -d /usr/local/go ]];then
    export GOROOT=/usr/local/go
    export PATH=$GOROOT/bin:$PATH
    # go proxy
    export GOPROXY=https://goproxy.cn,https://goproxy.io,direct
fi
 if [[ $(type go 2>/dev/null) ]] && [ -d "$HOME/go" ]; then
     export GOPATH=$HOME/go
     export PATH=$GOPATH/bin:$PATH
 fi

# 3rd party init
# nvm init
if [[ -d "$HOME/.nvm" ]]; then
  export NVM_DIR="$HOME/.nvm"
  [[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [[ -s "$NVM_DIR/bash_completion" ]] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

if [ $OS_NAME == "Darwin" ];then
  alias free="top -l 1 -s 0 | awk ' /Processes/ || /PhysMem/ || /Load Avg/{print}'"
fi

# local custom
if [ -f ~/.bash_local ]; then
  . ~/.bash_local
fi


#if [ -f ~/.fzf.bash ]; then
  #. ~/.fzf.bash
#fi
#export HTTP_PROXY=http://172.8.0.1:8118
#export HTTPS_PROXY=https://172.8.0.1:8118
#export NO_PROXY=localhost,127.0.0.1,192.168.99.0/24,192.168.39.0/24,192.168.49.0/24,10.96.0.0/12,172.17.0.0/24
# alias kubectl='minikube kubectl --'

