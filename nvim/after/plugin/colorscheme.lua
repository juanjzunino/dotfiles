-- General colors settings
vim.o.termguicolors = true
vim.o.background = 'dark'

-- Colorizer
require'colorizer'.setup()

-- Colorscheme
vim.g.tokyonight_style = "night"
vim.cmd 'colorscheme tokyonight'
