-- Local variables
local status_ok, lspconfig = pcall(require, "lspconfig")

if not status_ok then
	return
end

local signature_status_ok, lsp_signature = pcall(require, "lsp_signature")

if not signature_status_ok then
	return
end

-- LSP Saga
local saga_status_ok, saga = pcall(require, "lspsaga")

if not saga_status_ok then
	return
end

saga.setup({})


-- On attach
local custom_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings
	local bufopts = { noremap=true, silent=true, buffer=bufnr }

	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd",  vim.lsp.buf.definition, bufopts)
	-- vim.keymap.set("n", "K",  vim.lsp.buf.hover(), bufopts)
	vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", bufopts)
	vim.keymap.set("n", "gi",  vim.lsp.buf.implementation, bufopts)
	-- vim.keymap.set("n", "<C-k>",  vim.lsp.buf.signature_help(), bufopts)
	vim.keymap.set("n", "<C-k>", "<cmd>Lspsaga signature_help<CR>", bufopts)
	vim.keymap.set("n", "<space>D",  vim.lsp.buf.type_definition, bufopts)
	-- vim.keymap.set("n", "<space>rn",  vim.lsp.buf.rename(), bufopts)
	vim.keymap.set("n", "<space>rn", "<cmd>Lspsaga rename<CR>", bufopts)
	vim.keymap.set("n", "<space>a",  vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", '<cmd> require("telescope.builtin").lsp_references()<CR>', bufopts)
	vim.keymap.set("n", "gh", "<cmd>Trouble lsp_references<cr>", bufopts)
	vim.keymap.set("n", "<space>e",  vim.diagnostic.open_float, bufopts)
	vim.keymap.set("n", "[d",  vim.diagnostic.goto_prev, bufopts)
	vim.keymap.set("n", "]d",  vim.diagnostic.goto_next, bufopts)
	vim.keymap.set("n", "<space>q",  '<cmd>require("telescope.builtin").diagnostics()<CR>', bufopts)
	vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format { async = true } end, bufopts)
	vim.keymap.set("n", "<space>wd",  '<cmd>require("telescope.builtin").lsp_document_symbols()<CR>', bufopts)
	vim.keymap.set("n", "<space>ww",  '<cmd>require("telescope.builtin").lsp_workspace_symbols()<CR>', bufopts)

	-- Signature help
	lsp_signature.on_attach({
		bind = true,
		doc_lines = 0,
		handler_opts = {
			border = "rounded",
		},
	})

	-- Autoformat
	if client.server_capabilities.document_formatting then
		vim.cmd([[
			augroup lsp_buf_format
        au! BufWritePre <buffer>
        autocmd BufWritePre <buffer> :lua function() vim.lsp.buf.format { async = true } end
			augroup END
		]])
	end
end

-- Capabilities
local custom_capabilities = vim.lsp.protocol.make_client_capabilities()
custom_capabilities = require("cmp_nvim_lsp").default_capabilities(custom_capabilities)

-- Language Server Protocol
local servers = { "pyright", "rust_analyzer", "gopls", "ccls", "lua_ls", "yamlls" }

for _, server in pairs(servers) do
	lspconfig[server].setup({
		on_attach = custom_attach,
		capabilities = custom_capabilities,
	})
end
