-- General colors settings
vim.o.termguicolors = true
vim.o.background = 'dark'

-- Colorizer
require'colorizer'.setup()

-- Colorscheme
-- vim.cmd 'let g:gruvbox_contrast_dark = "hard"'
-- vim.cmd 'colorscheme gruvbox'

local nightfox = require("nightfox")

nightfox.setup({
  fox = "nordfox",
  alt_nc = true,
  visual = true,
  search = true,
  styles = {
    comments = "italic",
    -- keywords = "bold",
    -- functions = "italic,bold",
  },
})

nightfox.load()

vim.cmd 'highlight pythonTSField guifg=cleared'
vim.cmd 'highlight pythonTSParameter guifg=cleared'
