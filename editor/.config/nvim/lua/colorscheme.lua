-- General colors settings
vim.o.termguicolors = true
vim.o.background = 'dark'

-- Colorscheme
local base16 = require 'base16'
base16(base16.themes["gruvbox-dark-hard"], true)

-- Colorizer
require('colorizer').setup()
