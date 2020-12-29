" Neovim config file
set nocompatible

" -------------------------------- Plugins -----------------------------------
call plug#begin('~/.config/nvim/plugged')

" VIM enhancements
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'preservim/nerdtree'

" Git
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" Writing
Plug 'junegunn/goyo.vim'  
Plug 'junegunn/limelight.vim'  
Plug 'godlygeek/tabular'

" Text manipulation
Plug 'tpope/vim-commentary'

" Semantic language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntactic language support
Plug 'elzr/vim-json'
Plug 'stephpy/vim-yaml'
Plug 'cespare/vim-toml'
Plug 'plasticboy/vim-markdown'
Plug 'vim-python/python-syntax'
Plug 'rust-lang/rust.vim'
Plug 'dag/vim-fish'

" Color schemes
Plug 'chriskempson/base16-vim'
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
set spelllang=en,es

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
set nowrap

" Search settings
set ignorecase
set smartcase
set incsearch
set hlsearch

" Backspace works now
set backspace=indent,eol,start

" GUI
set cmdheight=2
set laststatus=2
set noshowmode
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
set undodir=~/.config/nvim/undodir
set undofile

" Colorscheme
if !has('gui_running')
  set t_Co=256
endif
set termguicolors
set background=dark
let base16colorspace=256
colorscheme base16-gruvbox-dark-hard

" Autocompletions
source ~/.config/nvim/coc.vim

" -------------------------------- Mappings ----------------------------------
" Open config file
nnoremap <leader>cf :e $MYVIMRC<cr>

" Disable Ex Mode
nmap Q <Nop>

" Quit w/ q:
map q: :q

" Set spell check
nnoremap <Leader>sc :set spell!<CR>

" Yank to clipboard
vnoremap y "*y

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

" Close buffer
nnoremap <leader>cb :bd<cr>

" Tab key indentation
vnoremap <Tab> >
vnoremap <S-Tab> <

" Unbind for tmux
map <C-a> <Nop>
map <C-x> <Nop>

" Split panes tmux style
nnoremap <Leader>- :sp<CR>
nnoremap <Leader>\| :vsp<CR>

" Ctrl+h to stop searching
vnoremap <C-h> :nohlsearch<cr>
nnoremap <C-h> :nohlsearch<cr>

" Very magic by default
nnoremap ? ?\v
nnoremap / /\v

" Search results centered
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Avoid bad habits
nnoremap <Left>  <nop>
nnoremap <Right> <nop>
nnoremap <Up>    <nop>
nnoremap <Down>  <nop>
inoremap <Left>  <nop>
inoremap <Right> <nop>
inoremap <Up>    <nop>
inoremap <Down>  <nop>

" ------------------------------ Autocommands --------------------------------
" Prevent accidental writes to buffers that shouldn't be edited
autocmd BufRead *.orig set readonly
autocmd BufRead *.pacnew set readonly

" Help filetype detection
autocmd BufRead *.md set filetype=markdown
autocmd BufRead *.tex set filetype=tex

" Default for writing files
augroup writing
    autocmd!
    autocmd Filetype markdown,tex,txt set colorcolumn=
    autocmd Filetype markdown,tex,txt set spell
    autocmd Filetype markdown,tex,txt set wrap
    autocmd Filetype markdown,tex,txt set encoding=utf-8
    autocmd Filetype markdown,tex,txt set fileencoding=utf-8
augroup END

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

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" FZF
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>
let g:fzf_layout = { 'down': '~20%' }

" Markdown
let g:vim_markdown_frontmatter = 1

" Python highlighting
let g:python_highlight_all = 1

" Vim Sneak
let g:sneak#s_next = 1

" Goyo
nnoremap <C-g> :Goyo<CR>

" Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status'
      \ }
      \ }


function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

