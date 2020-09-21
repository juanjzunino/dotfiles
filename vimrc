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
set hlsearch

"Keys bindings
nmap Q <Nop> "Disable Ex Mode
set backspace=indent,eol,start
set mouse+=a

"GUI
set laststatus=2
set showmode
set scrolloff=8
set nofoldenable

"Splits
set splitbelow splitright
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

"File type detection
filetype plugin indent on

"No swap files
set noswapfile
set nobackup
set nowb

"Undo
set undofile
set undodir=~/.vim/undodir

"Plugings (vim-plug)
call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-python/python-syntax'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'ciaranm/securemodelines'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'romainl/vim-cool'

call plug#end()

if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

"Colorscheme
set termguicolors
set background=dark
colorscheme onedark

"Python highlighting
let g:python_highlight_all = 1
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0

"Avoid bad habits
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>


"NerdTREE
noremap <Leader>n :NERDTreeToggle<CR>
noremap <Leader>f :NERDTreeFind<CR>


vnoremap <Tab> >
vnoremap <S-Tab> <
