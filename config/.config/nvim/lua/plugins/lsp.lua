return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local servers = {
        "lua_ls",
        "pyright",
        "ruff",
        "rust_analyzer",
        "gopls",
        "vtsls",
        "sqls",
      }

      vim.lsp.config("*", { capabilities = capabilities })

      for _, server in ipairs(servers) do
        vim.lsp.enable(server)
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(event)
          local opts = { buffer = event.buf }
          vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
          vim.keymap.set("n", "<leader>k", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
          vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
          vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
          vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
          vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
          vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
          vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
          vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
          vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if not client or not client.supports_method("textDocument/formatting") then
            return
          end

          local format_group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = format_group,
            buffer = event.buf,
            callback = function()
              local preferred = {
                lua = { "lua_ls" },
                python = { "ruff" },
                rust = { "rust_analyzer" },
                go = { "gopls" },
                javascript = { "biome", "vtsls" },
                javascriptreact = { "biome", "vtsls" },
                typescript = { "biome", "vtsls" },
                typescriptreact = { "biome", "vtsls" },
                sql = { "sqls" },
              }
              local ft = vim.bo[event.buf].filetype
              local preferred_clients = preferred[ft]

              vim.lsp.buf.format({
                bufnr = event.buf,
                filter = function(c)
                  if not preferred_clients then
                    return c.id == client.id
                  end
                  for _, name in ipairs(preferred_clients) do
                    if c.name == name then
                      return true
                    end
                  end
                  return false
                end,
              })
            end,
          })
        end,
      })
    end,
  },
}
