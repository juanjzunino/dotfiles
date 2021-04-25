-- General colors settings
vim.o.termguicolors = true
vim.o.background    = 'dark'
vim.o.t_Co          = '256'

-- Colorscheme
vim.cmd("let base16colorspace=256")
vim.cmd("colorscheme base16-gruvbox-dark-hard")

-- Colorizer
require('colorizer').setup()
