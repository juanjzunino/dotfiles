-- Local variables
local status_ok, lspconfig = pcall(require, "lspconfig")

if not status_ok then
	return
end

-- On attach
local custom_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	-- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = {noremap = true, silent = true}

	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', opts)
	buf_set_keymap('n', 'gh', '<cmd>Trouble lsp_references<cr>', opts)
	buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
	buf_set_keymap('n', '<space>wd', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>', opts)
	buf_set_keymap('n', '<space>ww', '<cmd>lua require("telescope.builtin").lsp_workspace_symbols()<CR>', opts)

  -- Autoformat
  if client.resolved_capabilities.document_formatting then
    vim.cmd [[
			augroup lsp_buf_format
        au! BufWritePre <buffer>
        autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting()
      augroup END
		]]
  end
end

-- Capabilities
local custom_capabilities = vim.lsp.protocol.make_client_capabilities()
custom_capabilities = require('cmp_nvim_lsp').update_capabilities(custom_capabilities)

-- Language Server Protocol
lspconfig.pyright.setup {
	on_attach = custom_attach,
	capabilities = custom_capabilities
}

lspconfig.rust_analyzer.setup {
  on_attach = custom_attach,
  capabilities = custom_capabilities
}

lspconfig.gopls.setup {
  on_attach = custom_attach,
  capabilities = custom_capabilities,
}

lspconfig.yamlls.setup {
	on_attach = custom_attach,
	capabilities = custom_capabilities
}

lspconfig.vimls.setup {
	on_attach = custom_attach,
	capabilities = custom_capabilities
}

lspconfig.clangd.setup{
	on_attach = custom_attach,
	capabilities = custom_capabilities
}

local sumneko_root_path = "/Users/juanjozunino/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/macOS/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}