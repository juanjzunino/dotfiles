return {
  {
    "https://github.com/nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter")
      treesitter.setup({})
      treesitter.install({ "python", "typescript", "javascript", "go", "rust", "lua" })

      local available = treesitter.get_available()
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true }),
        callback = function(event)
          local lang = vim.treesitter.language.get_lang(vim.bo[event.buf].filetype)
          if not lang or not vim.tbl_contains(available, lang) then
            return
          end

          local function start()
            if vim.api.nvim_buf_is_valid(event.buf) and pcall(vim.treesitter.start, event.buf, lang) then
              vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
              return true
            end
          end

          if not start() then
            treesitter.install({ lang }):await(vim.schedule_wrap(function(err)
              if not err then
                start()
              end
            end))
          end
        end,
      })
    end,
  },
}
