return {
  {
    "webhooked/kanso.nvim",
  },
  {
    "sainnhe/gruvbox-material",
    -- priority = 1000,
    -- config = function()
    --   vim.g.gruvbox_material_foreground = "original"
    --   vim.g.gruvbox_material_background = "hard"
    --   vim.g.gruvbox_material_ui_contrast = "high"
    --   vim.g.gruvbox_material_float_style = "bright"
    --   vim.g.gruvbox_material_statusline_style = "mix"
    --   vim.g.gruvbox_material_cursor = "auto"
    --   vim.cmd.colorscheme("gruvbox-material")
    -- end,
  },
  {
    "leaf",
    dir = vim.fn.stdpath("config") .. "/lua/leaf",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("leaf")
    end,
  }
}
