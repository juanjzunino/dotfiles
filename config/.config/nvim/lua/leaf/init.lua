local M = {}

function M.load()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "leaf"

  local palette = require("leaf.palette")
  local highlights = require("leaf.highlights")

  highlights.setup(palette.dark)
end

return M
