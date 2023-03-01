--[[ Notes:
./lua/jj/*.lua: This is where configuration/extensions for new plugins live.
./after/ftplugin/*.vim: This is where all specific file type configurations live.
--]]

-- Globals
DATA_PATH = vim.fn.stdpath("data")
CACHE_PATH = vim.fn.stdpath("cache")

-- Nvim configs
require("jj.options")
require("jj.keymaps")
require("jj.autocommands")
require("jj.colorscheme")
require("jj.plugins")

-- Plugins configs
require("jj.lspconfig")
require("jj.cmp")
require("jj.treesitter")
require("jj.telescope")
require("jj.nvimtree")
require("jj.lualine")
require("jj.gitsigns")
require("jj.autopairs")
