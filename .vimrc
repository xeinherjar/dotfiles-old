" Dod't care about VI
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
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'w0rp/ale'
    Plug 'vim-airline/vim-airline'

    " Languages
    Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
    Plug 'rust-lang/rust.vim', { 'for': 'rust' }

    " JavaScript
    Plug 'yuezk/vim-js'
    Plug 'maxmellon/vim-jsx-pretty'

    " Colorschemes
    Plug 'sainnhe/gruvbox-material'
call plug#end()


" Terminal..
set t_Co=256
let g:rehash256 = 1

set termguicolors
set background=dark
let g:gruvbox_material_background='hard'
let g:airline_theme='gruvbox_material'
colorscheme gruvbox-material

filetype plugin indent on   " detect filetype, load indents/plugins
syntax on                   " syntax highlighting


set noshowmode              " airline shows this anyway (insert/visual/replace)
set nowrap                  " Don't wrap lines

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
set sidescrolloff=10        " minimal number of columns to left/right of cursor
set cursorline              " highlight current line
set ignorecase
set smartcase               " search is not case sensative until you use a cap
set splitbelow              " split window below by default
set splitright              " split window to right by default
set synmaxcol=500           " stop highlting long lines

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

autocmd Filetype css            setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype go             setlocal ts=4 sts=4 sw=4
autocmd Filetype html           setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascript     setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascript.jsx setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype json           setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype python         setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype ruby           setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype scss           setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype typescript     setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yaml           setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype wast           setlocal ts=2 sts=2 sw=2 expandtab

" spellcheck for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell ts=2 sts=2 sw=2 expandtab
autocmd BufRead,BufNewFile *.markdown setlocal spell ts=2 sts=2 sw=2 expandtab
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

" turn off highlighted search results
nnoremap <leader><space> :nohlsearch<CR>

" Call Macro|Function
nnoremap <leader>W :call <SID>StripTrailingWhiteSpaces()<CR>
nnoremap <leader>N :call NumberToggle()<CR>

" Toggle on/off
nnoremap <leader>nn :NERDTreeToggle<CR>
" Toggle on with buffer file selected
nnoremap <leader>nf :NERDTreeFind%<CR>
" Close VIM if only NERDTree is left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" airline - only works with NERDtree enabled, this fixes that.
set laststatus=2

" removes > from airline since we aren't using a patched font
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" show hidden files/folders in NERDtree
let NERDTreeShowHidden=1

nmap <leader>f :FZF<CR>
nmap <leader>b :Buffers<CR>
" load fzf in a floating window in neovim
if has('nvim')
    let $FZF_DEFAULT_OPTS='--layout=reverse'
    let g:fzf_layout = { 'window': 'call FloatingFZF()' }

    function! FloatingFZF()
        let buf = nvim_create_buf(v:false, v:true)
        let height = float2nr(&lines * 0.9)
        let width = float2nr(&columns * 0.6)
        let horizontal = float2nr((&columns - width) / 2)
        let vertical = 1
        let opts = {
              \ 'relative': 'editor',
              \ 'row': vertical,
              \ 'col': horizontal,
              \ 'width': width,
              \ 'height': height
              \ }
        call nvim_open_win(buf, v:true, opts)
    endfunction
endif

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
