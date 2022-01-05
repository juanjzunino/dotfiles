-- General colors settings
vim.o.termguicolors = true
vim.o.background = 'dark'

-- Colorizer
require'colorizer'.setup()

-- Colorscheme
local base16 = require 'base16'
base16(base16.themes['gruvbox-dark-hard'], true)

-- Background
-- vim.cmd 'highlight Normal guibg=none'
-- vim.cmd 'highlight NonText guibg=none'

-- Yaml tweaks
vim.cmd 'highlight yamlTSField guifg=#83a598'
vim.cmd 'highlight yamlTSString guifg=cleared'

-- Python tweaks
vim.cmd 'highlight pythonTSField guifg=cleared'
vim.cmd 'highlight TSVariable guifg=cleared'
