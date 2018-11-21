# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# opts
HISTCONTROL=ignoreboth
export HISTSIZE=1000
export HISTFILESIZE=2000
shopt -s histappend
shopt -s checkwinsize
shopt -s nocaseglob
shopt -s cdspell
for option in autocd globstar; do
    shopt -s "$option" 2>/dev/null
done

# alias
alias reload='source ~/.bashrc'
alias ll='ls -lhF'
alias la='ls -A'
alias lla='ls -alhF'
alias ..='cd ..'
alias ...='cd ...'
alias md='mkdir -p'
alias cls='clear'
alias python='python3'

# export
export LC_ALL="en_US.utf-8"
export LANG="en_US"
export EDITOR='vim'
export OS_NAME=$(uname -s)

# dircolor
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
if [ -e /usr/share/terminfo/x/xterm-256color ] || [ -e /usr/share/terminfo/x/xterm+256color ];then
    export TERM='xterm-256color'
fi

# prompt colors
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
function set_bash_prompt()
{
    local exit_status="$?"
    PS1=""
    PS1+="${style_reset}[${style_user}\u"
    PS1+="${style_char}: "
    PS1+="${style_path}\w${style_reset}]"
    PS1+="$(prompt_smily $exit_status)"
    PS1+="${style_char}\$${style_reset}"
    PS2="> "
    PS3="> "
    PS4="+ "
}
PROMPT_COMMAND=set_bash_prompt

# functions
ips()
{
    ifconfig | grep "inet " | awk '{ print $2}'
}
mkcd()
{
    mkdir -p "$1"
    cd "$1"
}


# PATH
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.cargo/bin" ]; then
    #export PATH=~/.cargo/bin:$PATH
    PATH="$HOME/.cargo/bin:$PATH"
fi
if [ -d "$HOME/projects/go" ]; then
    export GOPATH=$HOME/projects/go
    export PATH=/usr/local/go/bin:$GOPATH/bin:$PATH
fi


# 3rd party init
# gvm init
[[ -s "/home/git/.gvm/scripts/gvm" ]] && source "/home/git/.gvm/scripts/gvm"


# custom
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
