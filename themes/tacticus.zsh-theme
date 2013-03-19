# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
if [[ "$EUID" = "0" ]] || [[ "$USER" = 'root' ]]
then 
    local user_host='%{$fg[red]%}%n%{$fg[white]%}@%{$fg[green]%}%m%{$reset_color%}'
elif [[ "$USER" = $DEFAULT_USER ]] ; then
    local user_host='%{$fg[blue]%}%n%{$fg[white]%}@%{$fg[green]%}%m%{$reset_color%}'
else
    local user_host='%{$fg[yellow]%}%n%{$fg[white]%}@%{$fg[green]%}%m%{$reset_color%}'
fi 
    
local current_dir='%F{green}%2c%f'
local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby='%{$fg[red]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm_ruby='%{$fg[red]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi
local git_branch='$(git_prompt_info)%{$reset_color%}'

PROMPT="╭─${user_host} ${current_dir}  ${rvm_ruby} ${git_branch}
╰─%B$%b "
RPS1="${return_code}"
RPROMPT='%F{green}%D{%L:%M} %F{yellow}%D{%p}%f'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
