-- General colors settings
vim.o.termguicolors = true
vim.o.background = 'dark'

-- Colorizer
local colorizer_status_ok, colorizer = pcall(require, 'colorizer')

if not colorizer_status_ok then
	return
end

colorizer.setup()

-- Tokyonight
vim.g.tokyonight_style = "night"
vim.cmd 'colorscheme tokyonight'

-- Solarized
-- vim.cmd 'colorscheme solarized'

-- Background
-- vim.cmd 'highlight Normal guibg=none'
-- vim.cmd 'highlight NonText guibg=none'

-- Python tweaks
-- vim.cmd 'highlight pythonTSField guifg=cleared'
-- vim.cmd 'highlight TSVariable guifg=cleared'
