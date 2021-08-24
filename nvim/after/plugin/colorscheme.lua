-- General colors settings
vim.o.termguicolors = true
vim.o.background = 'dark'

-- Colorizer
require'colorizer'.setup()

-- Colorscheme
vim.g.nightfox_style = "nordfox"
require('nightfox').set()
