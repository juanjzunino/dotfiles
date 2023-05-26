local status_ok, lualine = pcall(require, "lualine")

if not status_ok then
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "tokyonight",
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = {
			{ "mode", upper = true },
		},
		lualine_b = {
			{ "branch" },
		},
		lualine_c = {
			{ "filename",    file_status = true },
			{ "diagnostics", sources = { "nvim_diagnostic" } },
		},
		lualine_x = {
			"filetype",
		},
		lualine_y = {
			"encoding",
		},
		lualine_z = {
			"location",
		},
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "filetype" },
	},
	tabline = {},
	extensions = {},
})
