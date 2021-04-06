" ---------------------------------- Plugins ----------------------------------
call plug#begin()

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-rooter'

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
lua require('nv-treesitter')

" LSP
lua require('nv-lsp')

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" Compe
lua require('nv-compe')

" File Explorer
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" Bar
" nnoremap <silent> <A-,> :BufferPrevious<CR>
" nnoremap <silent> <A-.> :BufferNext<CR>
" nnoremap <silent> <A-c> :BufferClose<CR>

" ------------------------------ Editor Settings ------------------------------
" General
lua require('settings')
lua require('keymappings')
lua require('Colorscheme')

" --------------------------------- Mappings ----------------------------------

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
" Goyo
nnoremap <C-g> :Goyo<CR>

" Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
