-- General colors settings
vim.o.termguicolors = true
vim.o.background = "dark"

-- Colorizer
local colorizer_status_ok, colorizer = pcall(require, "colorizer")

if not colorizer_status_ok then
	return
end

colorizer.setup()

-- Colorscheme
vim.g.tokyonight_style = "night"
vim.cmd [[colorscheme catppuccin-mocha]]
