" Neovim config file
set nocompatible

" -------------------------------- Plugins -----------------------------------
call plug#begin('~/.config/nvim/plugged')

" VIM enhancements
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'

" GUI enhancements
Plug 'vim-airline/vim-airline'
Plug 'machakann/vim-highlightedyank'
Plug 'romainl/vim-cool'
Plug 'preservim/nerdtree'

" Git
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Writing
Plug 'junegunn/goyo.vim'  
Plug 'junegunn/limelight.vim'  

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" Text manipulation
Plug 'tpope/vim-commentary'

" Semantic language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntactic language support
Plug 'stephpy/vim-yaml'
Plug 'elzr/vim-json'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'vim-python/python-syntax'
Plug 'dag/vim-fish'

" Color schemes
Plug 'morhetz/gruvbox'

call plug#end()

" ---------------------------- Editor Settings -------------------------------
" Syntax highlighting
syntax on

" Leader key
let mapleader = " "

" Set encoding
set encoding=utf-8

" Set spelling
set nospell

" Lines (relative) numbers
set number
set relativenumber

" Tabs settings
set tabstop=4 softtabstop=4
set shiftwidth=4 
set expandtab
set smartindent

" Soft wrapping text
set linebreak
set wrap

" Fold
set foldenable
set foldlevelstart=10
set foldmethod=indent

" Search settings
set ignorecase
set smartcase
set incsearch
set hlsearch

" Backspace works now
set backspace=indent,eol,start

" GUI
set laststatus=2
set showmode
set scrolloff=8
set nofoldenable
set ttyfast
set wildmenu
set shortmess+=c
set cursorline
set mouse+=a
set signcolumn=yes
set colorcolumn=79

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
set undodir=~/.config/nvim/undodir

" Colorscheme
set termguicolors
set background=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

" hi! Normal ctermbg=NONE guibg=NONE 
" hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

" Autocompletions
source ~/.config/nvim/coc.vim

" -------------------------------- Mappings ----------------------------------
" Open config file
nnoremap <leader>cf :e $MYVIMRC<cr>

" Avoid bad habits
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" Disable Ex Mode
nmap Q <Nop>

" Yank to clipboard
vnoremap y "*y

" Unbind for tmux
map <C-a> <Nop>
map <C-x> <Nop>

" Jump to start and end of line using the home row keys
map H ^
map L $

" Move by line
nnoremap j gj
nnoremap k gk

" Move block up or down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Toggles between buffers
nnoremap <leader><leader> <c-^>

" Tab key indentation
vnoremap <Tab> >
vnoremap <S-Tab> <

" Split panes tmux style
nnoremap <Leader>- :sp<CR>
nnoremap <Leader>\| :vsp<CR>

" Search results centered
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" ------------------------------ Autocommands --------------------------------
" Prevent accidental writes to buffers that shouldn't be edited
autocmd BufRead *.orig set readonly
autocmd BufRead *.pacnew set readonly

" Help filetype detection
autocmd BufRead *.md set filetype=markdown
autocmd BufRead *.tex set filetype=tex

" Disable colorcolumn for writing
autocmd Filetype markdown,tex set colorcolumn=


" ----------------------------- Plugin Settings ------------------------------
" NerdTREE
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
" Airline
let g:airline#extensions#tabline#enabled = 1

" FZF
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>
let g:fzf_layout = { 'down': '~20%' }

" Markdown
let g:vim_markdown_frontmatter = 1

"Python highlighting
let g:python_highlight_all = 1

" Goyo
nnoremap <C-g> :Goyo<CR>

" Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

