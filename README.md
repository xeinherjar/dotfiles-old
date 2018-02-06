# Dotfiles

## OSX
-  Install [iTerm2](https://www.iterm2.com/)
-  Install [Alacritty](https://github.com/jwilm/alacritty) (evaluating as replacement of iTerm)
-  Install [homebrew](http://brew.sh/)
-  Install ZSH `brew install zsh`
-  Edit /etc/shell to have an entry for the brew installed zsh
-  Set Z Shell to default shell `chsh -s /usr/local/bin/zsh`
-  Close/Reopen iTerm
-  Install [oh-my-zsh](http://ohmyz.sh/)

## iTerm2
 -  Install ~/dotfiles/base16-ateliercave.itermcolors

## Alacritty
 `ln -s ~/dotfiles/alacritty ~/.config/alacritty`
 -  Need to use tmux, it doesn't offer scroll back or other *extra* terminal
    options

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
