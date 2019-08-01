" Don't care about VI
set nocompatible
set modelines=0

" Fix backspace
set backspace=indent,eol,start

" Setup plugins first
let config_dir = has("nvim") ? '~/.config/nvim' : '~/.vim'
if empty(glob(config_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo ' . config_dir . '/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall
endif
call plug#begin(config_dir . '/plugged')
    Plug 'airblade/vim-gitgutter'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'vim-airline/vim-airline'
    Plug 'w0rp/ale'

    " Languages
    Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
    Plug 'rust-lang/rust.vim', { 'for': 'rust' }

    " JavaScript
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'

    " Colorschemes
call plug#end()


" Terminal..
set t_Co=256
let g:rehash256 = 1
set background=dark

filetype plugin indent on   " detect filetype, load indents/plugins
syntax on                   " syntax highlighting

colorscheme jellybeans
"colorscheme base16-ateliercave

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
set cursorline              " highlight current line
set textwidth=80            " wrap at 80 characters

" Highlight when text exceedes 80 characters in length
" Without the group it only works on the first buffer opened
augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
  autocmd BufEnter * match OverLength /\%80v.\+/
augroup END

set matchpairs+=<:>         " match <> like other brackets
set iskeyword-=-            " - is end of word
set incsearch               " show partial results while typing
set hlsearch                " highlight search results


autocmd Filetype css        setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype go         setlocal ts=4 sts=4 sw=4
autocmd Filetype html       setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype python     setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype ruby       setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype scss       setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype wast       setlocal ts=2 sts=2 sw=2 expandtab

" spellcheck for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.markdown setlocal spell
" spellcheck on git commit messages
autocmd FileType gitcommit setlocal spell

" NeoVIM settings
if has ('nvim')
    " fixes CTRL+H mapping
    " https://github.com/neovim/neovim/issues/2048#issuecomment-78045837
    nmap <BS> <C-w>h
endif

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

" disable mouse
set mouse=""

" move display line, not text line
nnoremap j gj
nnoremap k gk

" move lines up/down with option/alt + j | k
" iTerm2 requires set option key as ESC+
" Profiles > Keys > 'Left Options acts as', set ESC+
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" back to normal mode, ie ESC
inoremap jj <ESC>

" windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Call native
nnoremap <leader><space> :nohlsearch<CR> " turn off highlighted search results

" Call Macro|Function
nnoremap <leader>W :call <SID>StripTrailingWhiteSpaces()<CR>
nnoremap <leader>N :call NumberToggle()<CR>

" Toggle on/off CTRL+N
map <C-n> :NERDTreeToggle<CR>
" Close VIM if only NERDTree is left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" airline - only works with NERDtree enabled, this fixes that.
set laststatus=2

" removes > from airline since we aren't using a patched font
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme= 'violet'

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

" Toggle number, relative number
function! NumberToggle()
    if(&relativenumber == 1)
        set number
        set norelativenumber
    else
        set relativenumber
    endif
endfunc
