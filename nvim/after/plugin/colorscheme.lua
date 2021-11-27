-- General colors settings
vim.o.termguicolors = true
vim.o.background = 'dark'

-- Colorizer
require'colorizer'.setup()

-- local nightfox = require("nightfox")

-- nightfox.setup({
--   fox = "nordfox",
--   alt_nc = true,
--   visual = true,
--   search = true,
--   styles = {
--     comments = "italic",
--     -- keywords = "bold",
--     -- functions = "italic,bold",
--   },
-- })

-- nightfox.load()

-- Colorscheme
local base16 = require 'base16'
base16(base16.themes["gruvbox-dark-hard"], true)


-- Python tweaks
vim.cmd 'highlight pythonTSField guifg=cleared'

-- Yaml tweaks
vim.cmd 'highlight yamlTSField guifg=#83a598'
vim.cmd 'highlight yamlTSString guifg=cleared'

-- Toml tweaks
vim.cmd 'highlight tomlTSProperty guifg=#83a598'
vim.cmd 'highlight tomlTSString guifg=cleared'
