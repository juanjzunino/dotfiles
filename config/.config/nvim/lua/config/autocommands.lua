-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Format Options
vim.api.nvim_create_autocmd({ "BufWinEnter", "BufRead", "BufNewFile" }, {
  command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
  group = vim.api.nvim_create_augroup("buf-format-options", { clear = true }),
})
