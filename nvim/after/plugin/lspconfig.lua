-- Local variables
local has_lsp, lspconfig = pcall(require, "lspconfig")

if not has_lsp then
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

	-- TODO: Use this when lspsaga is updated
	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', 'K', '<cmd>:Lspsaga hover_doc<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>:Lspsaga signature_help<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>:Lspsaga rename<CR>', opts)
  -- buf_set_keymap('n', '<space>a', '<cmd>:Lspsaga code_action<CR>', opts)
	buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', opts)
  buf_set_keymap('n', 'gh', '<cmd>:Lspsaga lsp_finder<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>:Lspsaga show_line_diagnostics<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>:Lspsaga diagnostic_jump_prev<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>:Lspsaga diagnostic_jump_next<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

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


local sumneko_root_path = DATA_PATH .. "/lspinstall/lua"
local sumneko_binary = sumneko_root_path .. "/sumneko-lua-language-server"

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  on_attach = custom_attach,
  capabilities = custom_capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';')
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'}
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true},
        maxPreload = 10000
      }
    }
  }
}

lspconfig.efm.setup {
  on_attach = custom_attach,
  init_options = {documentFormatting = true, codeAction = true},
  filetypes = {"lua", "python", "json", "yaml"},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      python = {
        -- {
        -- 	LintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
        -- 	lintStdin = true,
        -- 	lintFormats = { "%f:%l:%c: %m" },
        -- },
        {formatCommand = "isort --quiet -", formatStdin = true}
        -- {formatCommand = "yapf --quiet", formatStdin = true},
        -- {formatCommand = "black --quiet -", formatStdin = true},
      },
      -- lua = {{formatCommand = "lua-format -i --indent-width=2 --tab-width=2", formatStdin = true}},
      json = {{formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}},
      yaml = {{formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}}
    }
  }
}
