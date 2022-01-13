--[[ Notes:
./lua/jj/*.lua: This is where configuration/extensions for new style plugins live.
--]]

-- Globals
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

-- Nvim configs
require 'jj.options'
require 'jj.keymaps'
require 'jj.autocommands'
require 'jj.colorscheme'
require 'jj.plugins'

-- Plugins configs
require 'jj.lspconfig'
require 'jj.cmp'
require 'jj.nullls'
require 'jj.treesitter'
require 'jj.telescope'
require 'jj.nvimtree'
require 'jj.lualine'
require 'jj.gitsigns'
require 'jj.autopairs'
require 'jj.trouble'
