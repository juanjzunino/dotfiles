-- General colors settings
vim.o.termguicolors = true
vim.o.background = 'dark'

-- Colorizer
require'colorizer'.setup()

-- Colorscheme
-- local base16 = require 'base16'
-- base16(base16.themes["ocean"], true)

vim.cmd 'colorscheme solarized8'

-- Background
-- vim.cmd 'highlight Normal guibg=none'
-- vim.cmd 'highlight NonText guibg=none'

-- Python tweaks
-- vim.cmd 'highlight pythonTSField guifg=cleared'
-- vim.cmd 'highlight TSVariable guifg=cleared'
