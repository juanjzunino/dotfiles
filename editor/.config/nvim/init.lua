-- General
require('settings')
require('keymappings')
require('autocommands')
require('colorscheme')
require('plugins')

-- Plugins
require('nv-treesitter')
require('nv-compe')
require('nv-telescope')
require('nv-nvimtree')
require('nv-lspkind')

-- LSP
require('lsp')
require('lsp.python-ls')
require('lsp.lua-ls')
require('lsp.rust-ls')
require('lsp.r-ls')
require('lsp.bash-ls')
require('lsp.latex-ls')
