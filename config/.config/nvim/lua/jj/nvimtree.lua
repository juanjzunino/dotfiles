local status_ok, nvim_tree = pcall(require, "nvim-tree")

if not status_ok then
	return
end

vim.cmd [[autocmd FileType NvimTree highlight NvimTreeNormal guibg=#121415]]
vim.cmd [[autocmd FileType NvimTree highlight NvimTreeNormalNC guibg=#121415]]


nvim_tree.setup({})

vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeFindFile<CR>", { noremap = true })
