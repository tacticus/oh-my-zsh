setopt promptsubst
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
if [[ "$EUID" = "0" ]] || [[ "$USER" = 'root' ]]
then 
    local user_host='%{$fg[red]%}%n%{$fg[white]%}@%{$fg[green]%}%m%{$reset_color%}'
elif [[ "$USER" = $DEFAULT_USER ]] ; then
    local user_host='@%{$fg[green]%}%m%{$reset_color%}'
else
    local user_host='%{$fg[yellow]%}%n%{$fg[white]%}@%{$fg[green]%}%m%{$reset_color%}'
fi 



autoload -U add-zsh-hook

HOST_PROMPT_="%{$fg_bold[red]%}@$HOST[0,4] ➜  %{$fg_bold[cyan]%}%c "

PROMPT_SUCCESS_COLOR=$FG[117]
PROMPT_FAILURE_COLOR=$FG[124]
PROMPT_VCS_INFO_COLOR=$FG[242]
PROMPT_PROMPT=$FG[077]
GIT_DIRTY_COLOR=$FG[133]
GIT_CLEAN_COLOR=$FG[118]
GIT_PROMPT_INFO=$FG[012]

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_INFO%})"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$GIT_DIRTY_COLOR%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$GIT_CLEAN_COLOR%}✔"

PROMPT="╭─${user_host} %{$PROMPT_SUCCESS_COLOR%}%~%{$reset_color%}  
%{$reset_color%}╰─%{$reset_color%}%{$PROMPT_PROMPT%}ᐅ%{$reset_color%} "

RPROMPT='%{$GIT_PROMPT_INFO%}$(git_prompt_info)%{$GIT_DIRTY_COLOR%} $(git_prompt_status) %F{green}%D{%L:%M} %F{yellow}%D{%p}%f'


ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[082]%}✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[166]%}✹%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[160]%}✖%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[220]%}➜%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[082]%}═%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[190]%}✭%{$reset_color%}"

