syntax on

set nocompatible

" Tabs settings (Python PEP8)
set tabstop=4 softtabstop=4
set shiftwidth=4 
set expandtab "Convert tabs into spaces
set smartindent

" Set leader key
let mapleader = " "

" Lines (relative) numbers
set number
set relativenumber

" Soft wrapping text
set linebreak
set wrap

" Search settings
set ignorecase
set smartcase
set incsearch
set hlsearch

" Keys bindings
nmap Q <Nop> "Disable Ex Mode
set backspace=indent,eol,start
set mouse+=a

" GUI
set laststatus=2
set showmode
set scrolloff=8
set nofoldenable
set ttyfast
set wildmenu

" Splits
set splitbelow splitright
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" File type detection
filetype plugin indent on

" No swap files
set noswapfile
set nobackup
set nowb

" Buffers
set hidden

" Undo
set undofile
set undodir=~/.vim/undodir

"Plugings (vim-plug)
call plug#begin('~/.vim/plugged')

" Vim enhacements
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'

" GUI enhacements
Plug 'vim-airline/vim-airline'
Plug 'machakann/vim-highlightedyank'
Plug 'preservim/nerdtree'

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }  " FZF plugin, makes Ctrl-P unnecessary
Plug 'junegunn/fzf.vim'
Plug 'romainl/vim-cool'

" Writing
Plug 'junegunn/goyo.vim'

" Semantic language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntatic language support
Plug 'stephpy/vim-yaml'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'vim-python/python-syntax'

" Color schemes
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'

" Git
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

source ~/.vim/coc.vim


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

" Toggles between buffers
nnoremap <leader><leader> <c-^>

"Tab key indentation
vnoremap <Tab> >
vnoremap <S-Tab> <

"Split panes tmux style
nnoremap <Leader>- :sp<CR>
nnoremap <Leader>\| :vsp<CR>


" FZF
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>

let g:fzf_layout = { 'down': '~20%' }



" Plugin settings
let g:secure_modelines_allowed_items = [
                \ "textwidth",   "tw",
                \ "softtabstop", "sts",
                \ "tabstop",     "ts",
                \ "shiftwidth",  "sw",
                \ "expandtab",   "et",   "noexpandtab", "noet",
                \ "filetype",    "ft",
                \ "foldmethod",  "fdm",
                \ "readonly",    "ro",   "noreadonly", "noro",
                \ "rightleft",   "rl",   "norightleft", "norl",
                \ "colorcolumn"
                \ ]


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Sneak.vim
let g:sneak#label = 1

" goyo
nnoremap <C-g> :Goyo<CR>
