-- Local variables
local status_ok, lspconfig = pcall(require, "lspconfig")

if not status_ok then
	return
end

-- LSP Signature
local signature_status_ok, lsp_signature = pcall(require, "lsp_signature")

if not signature_status_ok then
	return
end

lsp_signature.setup()

-- LSP Saga
local saga_status_ok, saga = pcall(require, "lspsaga")

if not saga_status_ok then
	return
end

saga.setup({
	symbol_in_winbar = {
		enable = false,
	},
})

-- On attach
local custom_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", bufopts)
	vim.keymap.set("n", "<space>rn", "<cmd>Lspsaga rename<CR>", bufopts)
	vim.keymap.set("n", "<space>a", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", '<cmd>Telescope lsp_references<CR>', bufopts)
	vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, bufopts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
	vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format { async = true } end, bufopts)
	vim.keymap.set("n", "<space>wd", '<cmd> Telescope lsp_document_symbols<CR>', bufopts)
	vim.keymap.set("n", "<space>ww", '<cmd> Telescope lsp_workspace_symbols<CR>', bufopts)

	-- Autoformat
	vim.api.nvim_create_autocmd("BufWritePre", {
		buffer = bufnr,
		callback = function()
			vim.lsp.buf.format { async = false }
		end,
		group = vim.api.nvim_create_augroup("format_on_save", { clear = true }),
	})
end

-- Autocomplete
local custom_capabilities = vim.lsp.protocol.make_client_capabilities()
custom_capabilities = require("cmp_nvim_lsp").default_capabilities(custom_capabilities)

-- LSP Setup
local servers = { "pyright", "rust_analyzer", "gopls" }

for _, server in pairs(servers) do
	lspconfig[server].setup({
		capabilities = custom_capabilities,
		on_attach = custom_attach,
	})
end

lspconfig['lua_ls'].setup({
	on_attach = custom_attach,
	capabilities = custom_capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
})
