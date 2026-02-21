return {
  {
    "RRethy/base16-nvim",
    lazy = false,
    priority = 1000,
    -- config = function()
    --   vim.cmd("colorscheme gruvbox-dark-hard")
    -- end,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_foreground = "original"
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_ui_contrast = "high"
      vim.g.gruvbox_material_float_style = "bright"
      vim.g.gruvbox_material_statusline_style = "mix"
      vim.g.gruvbox_material_cursor = "auto"
      vim.cmd.colorscheme("gruvbox-material")
      vim.cmd("highlight normal guibg=#1d2021")
      vim.api.nvim_set_hl(0, "IncSearch", { bg = "#fe8019", fg = "#1d2021" })
      vim.api.nvim_set_hl(0, "CurSearch", { bg = "#fe8019", fg = "#1d2021" })
      vim.api.nvim_set_hl(0, "gitcommitSummary", { fg = "#ebdbb2" })
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    -- config = function()
    --   -- require("kanagawa").setup({})
    --   vim.cmd("colorscheme kanagawa-dragon")
    -- end,
  }
}
