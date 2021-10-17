--[[ Notes:
./after/plugin/*.lua: Where my plugings configuration lives
./lua/jj/*.lua: This is where configuration/extensions for new style plugins live.
--]]

-- Globals
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

-- Packer
require 'jj.plugins'
