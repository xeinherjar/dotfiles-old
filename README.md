# Dotfiles

Create symbolic links

.vimrc, .zshrc, .tmux.conf, xeinherjar.zsh-theme 

```
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/xeinherjar.zsh-theme ~/.oh-my-zsh/themes/xeinherjar.zsh-theme
```

Tell Git about global git ignore file
```
git config --global core.excludesfile ~/dotfiles/.gitignore_global
```
