if status is-interactive
  # Commands to run in interactive sessions can go here
  
  # cd ..
  function ..
    cd ..
  end

  # os
  function os
    switch (uname -s)
    case Darwin Linux
      eval command uname -s
    case "*"
      eval echo "undefined"
    end
  end

  function reload
    eval command . ~/.config/fish/config.fish
  end

  function ips
    eval command sudo ifconfig | grep 'inet ' | awk '{ print $2}'
  end

  # git
  function gcp
    eval command git checkout HEAD~1
  end

  function gdl
    eval command git diff HEAD~1..HEAD
  end

  function gsl
    eval command git shortlog -s -n
  end

  function gll
    eval command git log --graph --pretty --abbrev-commit
  end

  # path
  [ -d ~/bin ]; and fish_add_path ~/bin
  [ -d ~/.local/bin ]; and fish_add_path ~/.local/bin
  [ -d /opt/homebrew/bin ]; and fish_add_path /opt/homebrew/bin

  # alias
  alias gcp '/opt/homebrew/bin/gcp'
  alias .. 'cd ..'
  alias ... 'cd ../..'
  alias md 'mkdir -p'
  alias cls 'clear'

  if type -q exa
    alias ll 'exa -l'
    alias la 'exa -a'
    alias lla 'exa -al'
  end
  if type -q bat
    alias bat 'bat --theme="Solarized (dark)"'
  end

  # global env
  set --universal --export EDITOR vim
  set --universal --export LANG en_US
  set --universal --export LC_ALL en_US.utf-8
  set --universal --export TERM xterm-256color

  # conda
  [ -d ~/miniconda3/bin ]; and fish_add_path ~/miniconda3/bin
  #
  [ -d ~/.local/bin ]; and fish_add_path ~/.local/bin
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval /Users/robin/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

