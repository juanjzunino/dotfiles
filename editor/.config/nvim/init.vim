" ---------------------------------- Plugins ----------------------------------
call plug#begin()

" VIM enhancements
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'

" Git
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" Startify
Plug 'mhinz/vim-startify'

" Writing
Plug 'junegunn/goyo.vim'  
Plug 'junegunn/limelight.vim'  

" Text manipulation
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'

" Lsp
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'kabouzeid/nvim-lspinstall'
" Plug 'onsails/lspkind-nvim'  # Nice symbols

" Autocomplete
Plug 'hrsh7th/nvim-compe'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Colorscheme
Plug 'chriskempson/base16-vim'

call plug#end()

" ------------------------------ LSP Settings ---------------------------------
" Tree-Sitter
luafile ~/.config/nvim/treesitter.lua

" LSP
" npm i -g pyright
lua require'lspconfig'.pyright.setup{}

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>


" Compe
luafile ~/.config/nvim/compe.lua
" luafile ~/.config/nvim/lua/compe.lua

" ------------------------------ Editor Settings ------------------------------
" General
set nocompatible
syntax on
let mapleader = " "
filetype plugin indent on
set encoding=utf-8
set nospell
set spelllang=en,es
set completeopt=menuone,noselect

" Writing
set tabstop=4 softtabstop=4
set shiftwidth=4 
set expandtab
set smartindent
set linebreak
set nowrap
set nofoldenable

" Search
set ignorecase
set smartcase
set incsearch
set hlsearch

" Backspace works now
set backspace=indent,eol,start

" GUI
set number
set relativenumber
set showcmd
set cmdheight=2
set laststatus=2
set noshowmode
set scrolloff=8
set ttyfast
set synmaxcol=500
set wildmenu
set shortmess+=c
set cursorline
set mouse+=a
set signcolumn=yes
set colorcolumn=80
set splitbelow splitright

" No swap files
set noswapfile
set nobackup
set nowritebackup
set hidden
set undodir=~/.config/nvim/undodir
set undofile

" Completions
set updatetime=300

" Colorscheme (Gruvbox Base16)
if !has('gui_running')
  set t_Co=256
endif
set termguicolors
let base16colorspace=256
colorscheme base16-gruvbox-dark-hard

" --------------------------------- Mappings ----------------------------------
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
nnoremap y "*y

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
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
vnoremap > >gv
vnoremap < <gv

" Unbind for tmux
map <C-a> <Nop>
map <C-x> <Nop>

" Split panes tmux style
nnoremap <Leader>- :sp<CR>
nnoremap <Leader>\| :vsp<CR>

" Move easily between panes
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

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

" ------------------------------- Autocommands --------------------------------
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

" ------------------------------ Plugin Settings ------------------------------
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
      \ }
      \ }

" Retrieve filename
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

