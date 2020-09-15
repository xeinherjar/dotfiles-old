# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="xeinherjar"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export MANPATH="/usr/local/man:$MANPATH"
export EDITOR='emacs'

source $ZSH/oh-my-zsh.sh

# Arch
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/usr/bin/core_perl"
# PYENV
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
# XDG
export XDG_CONFIG_HOME=$HOME/.config
# Add wabt
export PATH="$PATH:$HOME/bin/wabt/bin"
# Local apps
export PATH="$HOME/bin:$PATH"

# Work Laptop
[ -e ~/work/work.rc ] && source ~/work/work.rc

# kubectl completes me
if [ -x "$(command -v kubectl)" ]
then
source <(kubectl completion zsh)
fi

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
export FZF_DEFAULT_OPTS="--layout=reverse --height 40% --border"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add rustup and rust support
export PATH="$PATH:$HOME/.cargo/bin"

# Add stack support
export PATH="$PATH:$HOME/.local/bin"


export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -e /home/alex/.nix-profile/etc/profile.d/nix.sh ]; then . /home/alex/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
alias nix-python="nix-shell --run \"pycharm .\" &> /dev/null & disown"
alias nix-idea="nix-shell --run \"idea .\" &> /dev/null & disown"
