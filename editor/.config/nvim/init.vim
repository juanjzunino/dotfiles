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
Plug 'onsails/lspkind-nvim'
Plug 'kabouzeid/nvim-lspinstall'

" Icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" Autocomplete
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" File explorer
Plug 'kyazdani42/nvim-tree.lua'
Plug 'romgrk/barbar.nvim'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Colorscheme
Plug 'chriskempson/base16-vim'


call plug#end()

" ------------------------------ LSP Settings ---------------------------------
" Tree-Sitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {'python',
                      'rust',
                      'go',
                      'lua',
                      'typescript',
                      'javascript',
                      'latex',
                      'bash',
                      'comment',
                      'json',
                      'yaml',
                      'toml'},
  highlight = { enable = true }
}
EOF


" LSP
" npm i -g pyright
" lua require'lspconfig'.pyright.setup{}
lua <<EOF
require'lspinstall'.setup() -- important

local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{}
end
EOF

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" Compe
lua <<EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF

" File Explorer
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" Bar
nnoremap <silent> <A-,> :BufferPrevious<CR>
nnoremap <silent> <A-.> :BufferNext<CR>
nnoremap <silent> <A-c> :BufferClose<CR>

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
" let g:lightline = {
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
"       \ },
"       \ 'component_function': {
"       \   'filename': 'LightlineFilename',
"       \ }
"       \ }

" " Retrieve filename
" function! LightlineFilename()
"   return expand('%:t') !=# '' ? @% : '[No Name]'
" endfunction

