#!/bin/bash
# Installs local user binaries to .local/bin

# folders
if [ ! -d "$HOME/.config" ]; then
    mkdir -p $HOME/.local/bin
    mkdir -p $HOME/.local/share/icons
    mkdir -p $HOME/software
    mkdir -p $HOME/.config
fi

sudo apt-get update

sudo apt-get -y install vim neovim git zsh tmux curl emacs fonts-hack \
    ripgrep apt-transport-https ca-certificates gnupg-agent software-properties-common \
    fzf

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    chsh -s /bin/zsh
fi

# Nix
if [ ! -e /home/alex/.nix-profile/etc/profile.d/nix.sh ]; then
    curl -L https://nixos.org/nix/install | sh
    . $HOME/.nix-profile/etc/profile.d/nix.sh
fi

# dotfiles
if [ ! -d "$HOME/dotfiles" ]; then
    git clone git@github.com:xeinherjar/dotfiles.git
    git config --global core.excludesfile ~/dotfiles/.gitignore_global

    ln -s ~/dotfiles/alacritty ~/.config/alacritty

    ln -s ~/dotfiles/.vimrc ~/.vimrc
    ln -s ~/dotfiles/.vim ~/.vim

    ln -s ~/dotfiles/.vim .config/nvim
    ln -s ~/dotfiles/.vimrc .config/nvim/init.vim

    # Since o-my-zsh is installed first, this may exist
    ln -s -f ~/dotfiles/.zshrc ~/.zshrc
    ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
    ln -s ~/dotfiles/xeinherjar.zsh-theme ~/.oh-my-zsh/themes/xeinherjar.zsh-theme

    # Switch to zsh, want this becasue of the env vars that are set in the rc
    # TODO: switch to zsh say yes to install when prompted for envvars
    ln -s ~/dotfiles/.doom.d ~/.doom.d
    git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
    ~/.emacs.d/bin/doom install
    ~/.emacs.d/bin/doom env
    ~/.emacs.d/bin/doom sync
fi

# Rust
if [ ! -f "$HOME/.cargo/env" ]; then
    curl https://sh.rustup.rs -sSf | sh -s -- -y
    source $HOME/.cargo/env
else
    rustup update
fi

# Docker
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#sudo add-apt-repository \
#   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) \
#   stable"
#sudo apt-get update
#sudo apt-get -y install docker-ce docker-ce-cli containerd.io
# sudo usermod -aG docker $(whoami)
# curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o ./.local/bin/docker-compose
# sudo chmod +x ./.local/bin/docker-compose


# Firefox nightly
if [ ! -d "$HOME/software/firefox" ]; then
# curl https://download.mozilla.org/?product=firefox-nightly-latest-ssl&os=linux64&lang=en-US
    echo "would fetch and extract firefox here... and setup desktopfile"
fi

# Alacritty
if [ ! -d "$HOME/software/alacritty" ]; then
    sudo apt-get -y install cmake pkg-config libfreetype6-dev libfontconfig1-dev \
        libxcb-xfixes0-dev python3
    git clone git@github.com:alacritty/alacritty.git ./software/alacritty
    (cd ./software/alacritty &&
    cargo build --release &&
    cp target/release/alacritty ~/.local/bin/ &&
    cp extra/logo/alacritty-term.svg ~/.local/share/icons/Alacritty.svg)
    # 0764?
    desktop-file-install --dir=$HOME/.local/share/applications ~/dotfiles/desktop/Alacritty.desktop
    sudo update-desktop-database
fi


# VSCode
# find perm download link
# sudo apt install ./vscode.deb

# aws cli
#curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
#unzip awscliv2.zip
#./aws/install -i $HOME/software/aws-cli -b $HOME/.local/bin
#rm awscliv2.zip
#rm -rf aws/

#to update
#curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
#unzip awscliv2.zip
#./aws/install -i $HOME/software/aws-cli -b $HOME/.local/bin --update




sudo apt-get -y upgrade
