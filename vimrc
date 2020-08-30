syntax on

set nocompatible

"Tabs settings
set tabstop=4 softtabstop=4
set shiftwidth=4 
set expandtab "Convert tabs into spaces
set smartindent

"Remap leader key
let mapleader = ","

"Lines (relative) numbers
set number
set rnu

"Soft wrapping text
set linebreak
set wrap

"Search settings
set ignorecase
set smartcase
set incsearch

"Keys bindings
nmap Q <Nop> "Disable Ex Mode
set backspace=indent,eol,start
set mouse+=a

"GUI
set nowrap
set laststatus=2
set showmode
set scrolloff=8

"Splits
set splitbelow splitright
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

"No swap files
set noswapfile
set nobackup
set nowb

"Plugings (vim-plug)
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-python/python-syntax'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

call plug#end()

"Colorscheme
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set background=dark

"Python highlighting
let g:python_highlight_all = 1
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0
