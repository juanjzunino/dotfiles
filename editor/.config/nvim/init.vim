" -- Plugins
call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-rooter'
Plug 'junegunn/goyo.vim'  
Plug 'junegunn/limelight.vim'  
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-tree.lua'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'chriskempson/base16-vim'

call plug#end()

" -- General
lua require('settings')
lua require('keymappings')
lua require('colorscheme')

" -- Plugins
lua require('nv-treesitter')
lua require('nv-lsp')
lua require('nv-compe')

" -- Autocommands
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
augroup END

" Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
