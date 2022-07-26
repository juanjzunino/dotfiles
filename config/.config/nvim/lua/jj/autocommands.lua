local api = vim.api

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank()",
	group = api.nvim_create_augroup("YankHighlight", { clear = true }),
})

-- Format Options
api.nvim_create_autocmd("BufWinEnter", {
	command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
	group = api.nvim_create_augroup("buf_win", { clear = true }),
})

api.nvim_create_autocmd("BufRead", {
	command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
	group = api.nvim_create_augroup("bun_win", { clear = true }),
})

api.nvim_create_autocmd("BufNewFile", {
	command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
	group = api.nvim_create_augroup("bue_newfile", { clear = true }),
})
