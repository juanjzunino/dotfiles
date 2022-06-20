let mapleader = " "

set nocompatible
syntax on
set encoding=utf-8
set nospell
set clipboard="unnamedplus"
filetype plugin indent on

set backspace=indent,eol,start
set shortmess+=c
set mouse+=a

set tabstop=4 softtabstop=4
set shiftwidth=4 
set expandtab
set smartindent

set linebreak
set nowrap
set foldenable
set foldmethod=marker
set foldlevel=3

set ignorecase
set smartcase
set incsearch
set hlsearch

set number
set relativenumber
set laststatus=2
set noshowmode
set scrolloff=8
set nofoldenable
set ttyfast
set wildmenu

set splitbelow splitright

set noswapfile
set nobackup
set nowritebackup
set hidden
set updatetime=300
set undodir=~/.vim/undodir
set undofile

set background=dark
colorscheme default
highlight Comment ctermfg=green
" highlight Normal ctermbg=none guibg=none

nmap Q <Nop>
map <C-a> <Nop>
map <C-x> <Nop>

map H ^
map L $

nnoremap j gj
nnoremap k gk

xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

nnoremap <leader><leader> <c-^>
vnoremap <Tab> >
vnoremap <S-Tab> <

nnoremap <C-w>h :wincmd h<CR>
nnoremap <C-w>j :wincmd j<CR>
nnoremap <C-w>k :wincmd k<CR>
nnoremap <C-w>l :wincmd l<CR>

nnoremap <Leader>- :sp<CR>
nnoremap <Leader>\| :vsp<CR>

vnoremap <C-h> :nohlsearch<cr>
nnoremap <C-h> :nohlsearch<cr>

nnoremap ? ?\v
nnoremap / /\v

nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

autocmd BufRead *.orig set readonly
autocmd BufRead *.pacnew set readonly
autocmd BufRead *.md set filetype=markdown
autocmd BufRead *.tex set filetype=tex
