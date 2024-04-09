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
require("tokyonight").setup({
	style = "night",
	transparent = true,
	styles = {
		sidebars = "light",
		floats = "transparent",
	}
})

vim.cmd [[colorscheme tokyonight]]
