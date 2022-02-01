vim.g.nvim_tree_icons = {
	git = {
		unstaged = "",
		staged = "✓",
		unmerged = "",
		renamed = "➜",
		untracked = "U",
		deleted = "",
		ignored = "◌",
	},
}

local status_ok, nvim_tree = pcall(require, "nvim-tree")

if not status_ok then
	return
end

nvim_tree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {},
	auto_close = true,
	open_on_tab = false,
	update_to_buf_dir = {
		enable = true,
		auto_open = true,
	},
	hijack_cursor = false,
	update_cwd = false,
	diagnostics = {
		enable = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = false,
		update_cwd = false,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	view = {
		width = 30,
		height = 30,
		side = "left",
		auto_resize = false,
		mappings = {
			custom_only = false,
			list = {},
		},
	},
})

vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeFindFile<CR>", { noremap = true })
