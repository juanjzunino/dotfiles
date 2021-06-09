-- Globals
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

-- General
require('settings')
require('keymappings')
require('autocommands')
require('colorscheme')
require('plugins')

-- Plugins
require('nv-autopairs')
require('nv-compe')
require('nv-dashboard')
require('nv-galaxyline')
-- require('nv-gitsigns')
require('nv-lspkind')
require('nv-nvimtree')
require('nv-telescope')
require('nv-treesitter')

-- LSP
require('lsp')
require('lsp.bash-ls')
require('lsp.clang-ls')
require('lsp.efm-lang-server')
require('lsp.go-ls')
require('lsp.javascript-ls')
require('lsp.json-ls')
require('lsp.latex-ls')
require('lsp.lua-ls')
require('lsp.python-ls')
require('lsp.r-ls')
require('lsp.rust-ls')
require('lsp.yaml-ls')
require('lsp.vim-ls')
