
# Modify bash prompt to show `user@machine:directory`
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "


### Helpful functions/aliases ###

# List files as pretty, verbose single file
alias ll='ls -AlFGh'

# Search history quickly
function hs {
  history | grep $@
}

# Create a directory and immediately cd into it
function mkcd {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}


### git ###

if [ -f ~/.git_aliases ]; then
    . ~/.git_aliases
fi

# http://git-scm.com/book/en/Git-Basics-Tips-and-Tricks#Auto-Completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
