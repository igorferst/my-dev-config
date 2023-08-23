plugins=(git ssh-agent)
autoload -Uz compinit && compinit

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

# Github SSH key
eval "$(ssh-agent -s)" &>/dev/null
ssh-add --apple-use-keychain ~/.ssh/id_gh &>/dev/null
