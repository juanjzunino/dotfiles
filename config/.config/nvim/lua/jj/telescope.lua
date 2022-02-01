local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

telescope.setup()
vim.api.nvim_set_keymap("n", "<leader>ff", '<cmd>lua require("telescope.builtin").find_files()<CR>', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fg", '<cmd>lua require("telescope.builtin").live_grep()<CR>', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fb", '<cmd>lua require("telescope.builtin").buffers()<CR>', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fh", '<cmd>lua require("telescope.builtin").help_tags()<CR>', { noremap = true })

--[[
Neovim LSP Pickers:
	- lsp_references [~/.config/nvim/lua/jj/lspconfig.lua]
	- lsp_document_diagnostic [~/.config/nvim/lua/jj/lspconfig.lua]
	- lsp_<document,workspace>_symbols [~/.config/nvim/lua/jj/lspconfig.lua]
--]]
