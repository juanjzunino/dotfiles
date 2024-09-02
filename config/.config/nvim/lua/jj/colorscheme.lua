-- General colors settings
vim.o.termguicolors = true
vim.o.background = "dark"

-- Colorscheme
local tokyo_status_ok, tokyo = pcall(require, "tokyonight")

if not tokyo_status_ok then
	return
end

tokyo.setup({
	style = "night",
	transparent = true,
	styles = {
		sidebars = "light",
		floats = "transparent",
	}
})

vim.cmd [[colorscheme tokyonight]]
