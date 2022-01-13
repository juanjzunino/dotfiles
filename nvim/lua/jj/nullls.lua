local status_ok, null_ls = pcall(require, 'null-ls')

if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.black.with({ extra_args = { '--fast' } }),
		diagnostics.flake8.with({ extra_args = { '--ignore', 'E266,E501,W503' } })
	},
})
