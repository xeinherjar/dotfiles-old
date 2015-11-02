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
mkdir -p ~/.config
ln -s ~/dotfiles/.vim .config/nvim
ln -s ~/dotfiles/.vimrc .config/nvim/init.vim
```

Use git submodules for pathogen
```
cd ~/.vim/bundle
git submodule add git@path/to/to/good/stuff.git
git add .
git commit -m "installed x plugin"
```

I use Syntastic 
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
