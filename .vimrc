" Don't care about VI
set nocompatible
set modelines=0

" Fix backspace
set backspace=indent,eol,start

" Terminal..
set t_Co=256
let g:rehash256 = 1
set background=dark

filetype plugin indent on   " detect filetype, load indents/plugins
syntax on                   " syntax highlighting

"colorscheme Molokai
colorscheme jellybeans

set softtabstop=4           " tab = 4 spaces
set shiftwidth=4            " auto indent 4 spaces
set expandtab               " insert tab as spaces

set ruler
set number                  " show line numbers
set autoindent smartindent
set showmatch               " show matching bracket
set encoding=utf-8          " character encoding
set visualbell              " use visual bell vs beeping
set scrolloff=5             " minimal number of lines above/below cursor

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
let g:airline_powerline_fonts = 1


" GitGutter
" https://github.com/airblade/vim-gitgutter

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 4
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Key maps
let mapleader = ","

" force myself to use hjkl for nav
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>

" move display line, not text line
nnoremap j gj
nnoremap k gk

" back to normal mode, ie ESC
inoremap jj <ESC>

" windows
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Call Macro|Function
nnoremap <leader>W :call <SID>StripTrailingWhiteSpaces()<CR>


" Macros, functions

" Strip Trailing Whitespace
function! <SID>StripTrailingWhiteSpaces()
    " save last search and cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    " strip it
    %s/\s\+$//e
    " restore
    let @/=_s
    call cursor(l, c)
endfunction
