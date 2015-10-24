
#### Helpful functions/aliases ####

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

source ~/.docker_aliases
# Go ahead and engage Docker
dm.init

source ~/.git_aliases

################################

#### ssh-agent ####
# http://mah.everybody.org/docs/ssh

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
  echo "Initialising new SSH agent..."
  /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  echo succeeded
  chmod 600 "${SSH_ENV}"
  . "${SSH_ENV}" > /dev/null
  /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
  . "${SSH_ENV}" > /dev/null
  #ps ${SSH_AGENT_PID} doesn't work under cywgin
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_agent;
  }
else
  start_agent;
fi

################################

# Modify bash prompt to show `user@machine:directory (git branch)`
source ~/.git-prompt.sh
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[35m\]\$(__git_ps1)\[\033[m\]\$ "

# Git completion
# http://git-scm.com/book/en/Git-Basics-Tips-and-Tricks#Auto-Completion
source ~/.git-completion.bash

# Add /usr/local/... to path
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
