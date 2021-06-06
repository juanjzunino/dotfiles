-- General colors settings
vim.o.termguicolors = true
vim.o.background = 'dark'
-- vim.o.t_Co = '256'

-- Colorscheme
vim.cmd 'colorscheme gruvbox'
-- vim.cmd 'colorscheme lunar'
-- require('colorbuddy').colorscheme('gruvbuddy')


-- Colorizer
require('colorizer').setup()
