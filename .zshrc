plugins=(git ssh-agent)
autoload -Uz compinit && compinit
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# Customize prompt
PROMPT='%F{white}%2~%f %# '

# Add git branch name as right prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%f'
zstyle ':vcs_info:*' enable git

# Aliases
source ~/.helpful_aliases
source ~/.git_aliases
source ~/.docker_aliases

# z
_Z_CMD='q'
. `brew --prefix`/etc/profile.d/z.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
