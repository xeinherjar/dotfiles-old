# Dotfiles

## OSX
-  Install [Alacritty](https://github.com/jwilm/alacritty)
-  Install [homebrew](http://brew.sh/)
-  Install ZSH `brew install zsh`
-  Edit /etc/shell to have an entry for the brew installed zsh
-  Set Z Shell to default shell `chsh -s /usr/local/bin/zsh`
-  Install [oh-my-zsh](http://ohmyz.sh/)


## Alacritty
 `ln -s ~/dotfiles/alacritty ~/.config/alacritty`

## Vim or NeoVim
```
brew install vim
brew install neovim
```

### Add dot files add vim plugins
For Vim
```
cd ~
git clone git@github.com:xeinherjar/dotfiles.git
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim
```

For NeoVim
```
mkdir -p ~/.config
ln -s ~/dotfiles/.vim .config/nvim
ln -s ~/dotfiles/.vimrc .config/nvim/init.vim
```


For JavaScript/ES2015/JSX
```
npm install -g eslint
npm install -g babel-eslint
npm install -g eslint-plugin-react

ln -s ~/dotfiles/.eslintrc ~/.eslintrc
```

## zsh, oh-my-zsh, tmux
```
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/xeinherjar.zsh-theme ~/.oh-my-zsh/themes/xeinherjar.zsh-theme
```

Tell Git about global git ignore file
```
git config --global core.excludesfile ~/dotfiles/.gitignore_global
```

## Emacs?
```
ln -s ~/dotfiles/.emacs.d ~/.emacs.d
```

## Linux Applications
-  Install [PyEnv](https://github.com/pyenv/pyenv#installation)
  -  `git clone https://github.com/pyenv/pyenv.git ~/.pyenv`
-  Install [PyEnv-Virtualenv](https://github.com/pyenv/pyenv-virtualenv)
  -  `git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv`
-  Install [RustUp](https://rustup.rs/)
-  Exa
-  Ripgrep
