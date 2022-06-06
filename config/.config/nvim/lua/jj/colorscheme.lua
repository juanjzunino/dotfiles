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
local base16 = require 'base16'
base16(base16.themes["atelier-dune"], true)
