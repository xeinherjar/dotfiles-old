# Dotfiles


## VIM
Install VIM and pathogen.vim

```
cd ~
git clone git@github.com:xeinherjar/dotfiles.git
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim
cd ~/.vim
git submodule init
git submodule update
```

Need to update all plugins?
`git submodule foreach git pull origin master`

Recently started using NeoVim
```
ln -s ~/.vimrc ~/.nvimrc
ln -s ~/.vim ~/.nvim
```

Use git submodules for pathogen
```
cd ~/.vim/bundle
git submodule add git@path/to/to/good/stuff.git
git add .
git commit -m "installed x plugin"
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
