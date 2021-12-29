-- General colors settings
vim.o.termguicolors = true
vim.o.background = 'dark'

-- Colorizer
require'colorizer'.setup()

-- Colorscheme
vim.g.tokyonight_style = "night"
vim.cmd 'colorscheme tokyonight'

-- Background
vim.cmd 'highlight Normal guibg=none'
vim.cmd 'highlight NonText guibg=none'

-- Python tweaks
-- vim.cmd 'highlight pythonTSField guifg=cleared'
-- vim.cmd 'highlight TSVariable guifg=cleared'
