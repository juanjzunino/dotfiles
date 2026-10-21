return {
  {
    "webhooked/kanso.nvim",
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.termguicolors = true
      vim.o.background = "dark"
      require("gruvbox").setup({
        contrast = "hard",
        palette_overrides = { dark0_hard = "#161819" },
      })
    end,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.termguicolors = true
      vim.o.background = "dark"
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_enable_bold = 0
      vim.g.gruvbox_material_colors_override = {
        bg0 = { "#161819", "234" },
      }
      vim.cmd.colorscheme("gruvbox-material")
    end,
  }
}
