# # modify the prompt to contain git branch name if applicable
# git_prompt_info() {
#   current_branch=$(git current-branch 2> /dev/null)
#   if [[ -n $current_branch ]]; then
#     echo " %{$fg_bold[green]%}$current_branch%{$reset_color%}"
#   fi
# }
# setopt promptsubst
# PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%}$(git_prompt_info) %# '

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv virtualenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history time)
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="green"
POWERLEVEL9K_DIR_FOREGROUND="white"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
POWERLEVEL9K_STATUS_VERBOSE=false
