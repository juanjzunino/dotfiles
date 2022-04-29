local status_ok, nvim_tree = pcall(require, "nvim-tree")

if not status_ok then
	return
end

nvim_tree.setup({})

vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeFindFile<CR>", { noremap = true })
