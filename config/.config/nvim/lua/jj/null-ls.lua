local status_ok, null_ls = pcall(require, "null-ls")

if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.yapf,
		-- formatting.black.with({ extra_args = { "--fast" } }),
		formatting.prettier.with({ extra_filetypes = { "toml" } }),
		diagnostics.flake8,
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
				augroup LspFormatting
						autocmd! * <buffer>
						autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
				augroup END
			]])
		end
	end,
})
