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
        "ty",
        "ruff",
        "rust_analyzer",
        "gopls",
        "vtsls",
        "oxlint",
        "oxfmt",
        "sqls",
      }

      vim.lsp.config("*", { capabilities = capabilities })

      vim.lsp.config("ruff", {
        cmd = { "uvx", "ruff", "server" },
      })
      vim.lsp.config("ty", { cmd = { "uvx", "ty", "server" } })

      local oxc_config = {
        root_dir = function(bufnr, on_dir)
          local root = vim.fs.root(bufnr, { "package.json", ".git" })
            or vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
          on_dir(root)
        end,
      }
      vim.lsp.config("oxlint", oxc_config)
      vim.lsp.config("oxfmt", oxc_config)

      for _, server in ipairs(servers) do
        vim.lsp.enable(server)
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("LspActions", { clear = true }),
        desc = "LSP actions",
        callback = function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client then
            -- Keep syntax colors consistent instead of layering LSP semantic colors over them.
            client.server_capabilities.semanticTokensProvider = nil
          end
          if client and client.name == "ruff" then
            client.server_capabilities.hoverProvider = false
          elseif client and client.name == "vtsls" then
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end

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
        end,
      })

      local formatters = {
        lua = "lua_ls",
        python = "ruff",
        rust = "rust_analyzer",
        go = "gopls",
        javascript = "oxfmt",
        javascriptreact = "oxfmt",
        typescript = "oxfmt",
        typescriptreact = "oxfmt",
        sql = "sqls",
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        desc = "Format with the designated language server",
        group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = true }),
        callback = function(event)
          local formatter = formatters[vim.bo[event.buf].filetype]
          if not formatter then
            return
          end

          local client = vim.lsp.get_clients({
            bufnr = event.buf,
            name = formatter,
            method = "textDocument/formatting",
          })[1]
          if client then
            vim.lsp.buf.format({ bufnr = event.buf, id = client.id, async = false, timeout_ms = 3000 })
          end
        end,
      })
    end,
  },
}
