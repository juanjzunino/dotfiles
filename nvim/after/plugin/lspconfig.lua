-- Local variables
local has_lsp, lspconfig = pcall(require, "lspconfig")

if not has_lsp then
	return
end

local nvim_status = require('lsp-status')

_ = require("lspkind").init()

-- On init
local custom_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

-- On attach
local custom_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  nvim_status.on_attach(client)

  -- Mappings
  local opts = {noremap = true, silent = true}

  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>:Lspsaga hover_doc<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>:Lspsaga rename<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>:Lspsaga code_action<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>:Lspsaga diagnostic_jump_prev<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>:Lspsaga diagnostic_jump_next<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Autoformat
  if client.resolved_capabilities.document_formatting then
    vim.cmd [[
			augroup lsp_buf_format
        au! BufWritePre <buffer>
        autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting()
      augroup END
			]]
  end

  -- Document highlighting
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end

end

-- Capabilities
local custom_capabilities = vim.lsp.protocol.make_client_capabilities()
custom_capabilities.textDocument.completion.completionItem.snippetSupport = true
custom_capabilities.textDocument.completion.completionItem.resolveSupport =
    {properties = {"documentation", "detail", "additionalTextEdits"}}

-- Language Server Protocol
require'lspconfig'.pyright.setup {
	on_init = custom_init,
	on_attach = custom_attach,
	capabilities = custom_capabilities
}

lspconfig.rust_analyzer.setup {
  cmd = {"rust-analyzer"},
  filetypes = {"rust"},
  on_init = custom_init,
  on_attach = custom_attach,
  capabilities = custom_capabilities
}

lspconfig.gopls.setup {
  on_init = custom_init,
  on_attach = custom_attach,
  capabilities = custom_capabilities,
  settings = {gopls = {codelenses = {test = true}}},
  flags = {debounce_text_changes = 200}
}

lspconfig.yamlls.setup {
	on_init = custom_init,
	on_attach = custom_attach,
	capabilities = custom_capabilities
}

local sumneko_root_path = DATA_PATH .. "/lspinstall/lua"
local sumneko_binary = sumneko_root_path .. "/sumneko-lua-language-server"

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  on_init = custom_init,
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

require"lspconfig".efm.setup {
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
      lua = {{formatCommand = "lua-format -i --column-limit=120 --indent-width=2 --tab-width=2", formatStdin = true}},
      json = {{formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}},
      yaml = {{formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}}
    }
  }
}
