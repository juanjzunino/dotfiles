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
require('nv-treesitter')
require('nv-compe')
require('nv-telescope')
require('nv-nvimtree')
require('nv-lspkind')
require('nv-lualine')

-- LSP
require('lsp')
require('lsp.python-ls')
require('lsp.rust-ls')
require('lsp.bash-ls')
require('lsp.go-ls')
require('lsp.javascript-ls')
require('lsp.lua-ls')
require('lsp.efm-lang-server')
require('lsp.r-ls')
require('lsp.json-ls')
require('lsp.yaml-ls')
require('lsp.latex-ls')
require('lsp.vim-ls')
