" Neovim config file
set nocompatible

"============================ Plugins ============================

call plug#begin('~/.config/nvim/plugged')

" VIM enhacements
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'

" GUI enhacements
Plug 'vim-airline/vim-airline'
Plug 'machakann/vim-highlightedyank'
Plug 'preservim/nerdtree'

" Git
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Writing
Plug 'junegunn/goyo.vim'  

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'romainl/vim-cool'

" Text manipulation
Plug 'tpope/vim-commentary'

" Semantic language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntatic language support
Plug 'stephpy/vim-yaml'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'vim-python/python-syntax'
Plug 'dag/vim-fish'

" Color schemes
Plug 'morhetz/gruvbox'

call plug#end()


"======================= Editor Settings =========================

" Syntax highlighting
syntax on

" Leader key
let mapleader = " "

" Lines (relative) numbers
set number
set relativenumber

" Tabs settings
set tabstop=4 softtabstop=4
set shiftwidth=4 
set expandtab "Convert tabs into spaces
set smartindent

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
set shortmess+=c

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
set nowritebackup

" Buffers
set hidden

" Completions
set updatetime=300

" Undo
set undofile
set undodir=~/.vim/undodir

" Colorscheme
set termguicolors
set background=dark
colorscheme gruvbox

" Autocompletions
source ~/.config/nvim/coc.vim

"===================== Keyboard Shortcuts ========================

"Avoid bad habits
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" Move by line
nnoremap j gj
nnoremap k gk

" Toggles between buffers
nnoremap <leader><leader> <c-^>

"Tab key indentation
vnoremap <Tab> >
vnoremap <S-Tab> <

"Split panes tmux style
nnoremap <Leader>- :sp<CR>
nnoremap <Leader>\| :vsp<CR>

"========================= Autocommands ==========================

"======================== Plugin Settings ========================

"NerdTREE
noremap <Leader>n :NERDTreeToggle<CR>

" Secure modeline
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

" FZF
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>
let g:fzf_layout = { 'down': '~20%' }

" Markdown
let g:vim_markdown_frontmatter = 1

"Python highlighting
let g:python_highlight_all = 1
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0

"Goyo
nnoremap <C-g> :Goyo<CR>