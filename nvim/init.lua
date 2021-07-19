--[[ Notes:
./after/plugin/*.lua
  This is where configuration for plugins live.
  They get auto sourced on startup. In general, the name of the file configures
  the plugin with the corresponding name.
./lua/jj/*.lua
  This is where configuration/extensions for new style plugins live.
  They don't get sourced automatically, but do get sourced by doing something like:
    require('jj.dap')
  or similar. I generally recommend that people do this so that you don't accidentally
  override any of the plugin requires with namespace clashes. So don't just put your configuration
  in "./lua/dap.lua" because then it will override the plugin version of "dap.lua"
--]]

-- Globals
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

-- Packer
require 'jj.plugins'
