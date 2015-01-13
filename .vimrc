" Don't care about VI
set nocompatible

set t_Co=256
let g:rehash256 = 1

filetype plugin indent on
syntax on

colorscheme Molokai
set background=dark

set softtabstop=4
set shiftwidth=4
set expandtab

set ruler
set number
set autoindent smartindent

autocmd Filetype html       setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype css        setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype scss       setlocal ts=2 sts=2 sw=2 expandtab

" spellcheck for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.markdown setlocal spell
" spellcheck on git commit messages
autocmd FileType gitcommit setlocal spell

" plugins
execute pathogen#infect()

" nerdtree
" open automatically
" autocmd vimenter * NERDTree
" open automatically without file
" autocmd StdinReadPre * let s:std_in:1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Toggle on/off CTRL+N
map <C-n> :NERDTreeToggle<CR>
" Close VIM if only NERDTree is left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" airline - only works with NERDtree enabled, this fixes that.
set laststatus=2

" GitGutter
" https://github.com/airblade/vim-gitgutter
