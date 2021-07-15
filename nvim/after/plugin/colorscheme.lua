if not pcall(require, "colorbuddy") then
	return
end

-- General colors settings
vim.o.termguicolors = true
vim.o.background = 'dark'

-- Colorscheme
require('colorbuddy').colorscheme('gruvbuddy')
require('colorizer').setup()
