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
      require("gruvbox").setup({ contrast = "hard" })
      vim.cmd.colorscheme("gruvbox")
    end,
  },
  {
    "leaf",
    dir = vim.fn.stdpath("config") .. "/lua/leaf",
    lazy = true,
  }
}
