-- General colors settings
vim.o.termguicolors = true
vim.o.background = 'dark'

-- Colorizer
require'colorizer'.setup()

-- Colorscheme
local base16 = require 'base16'
base16(base16.themes["gruvbox-dark-medium"], true)

