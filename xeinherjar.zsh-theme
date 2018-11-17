PROMPT='%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m %{$fg[green]%}» %{$fg[yellow]%}${PWD/#$HOME/~}%{$reset_color%} $(git_prompt_info)
%{$fg[magenta]%}λ%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="» %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
