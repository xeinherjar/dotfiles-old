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

# Linux or OSX?
case "$(uname -s)" in
    Linux)
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
        # Scala needs that sweet sweet JVM, to bad java comes along
        export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")
        ;;
    Darwin)
        # Work Laptop
        # Local apps
        export PATH="$HOME/bin:$PATH"
        # sets env vars, jvm aliases
        source ~/work/BetterCloudEnv
        ;;
esac

# kubectl completes me
if [ -x "$(command -v kubectl)" ]
then
source <(kubectl completion zsh)
fi

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="--layout=reverse --height 40% --border"

# Pyenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=0
eval "$(pyenv init -)"
# Pyenv virtualenv support, this allows it to auto source when moving into a
# directory
eval "$(pyenv virtualenv-init -)"

# Add rustup and rust support
export PATH="$PATH:$HOME/.cargo/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
