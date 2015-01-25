PROMPT='%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m %{$fg[green]%}» %{$fg[yellow]%}${PWD/#$HOME/~}%{$reset_color%} $(git_prompt_info)
%{$fg[magenta]%}»%{$fg[yellow]%}»%{$fg[green]%}»%{$reset_color%} '


alias subl="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}«» %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
