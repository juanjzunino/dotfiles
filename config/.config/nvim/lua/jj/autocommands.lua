local api = vim.api

-- Highlight on yank
local yank_acmd = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank()",
	group = yank_acmd,
})

-- Format Options
local buf_win_acmd = api.nvim_create_augroup("buf_win", { clear = true })
api.nvim_create_autocmd("BufWinEnter", {
	command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
	group = buf_win_acmd,
})

local buf_read_acmd = api.nvim_create_augroup("bun_win", { clear = true })
api.nvim_create_autocmd("BufRead", {
	command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
	group = buf_read_acmd,
})

local buf_newfile_acmd = api.nvim_create_augroup("bue_newfile", { clear = true })
api.nvim_create_autocmd("BufNewFile", {
	command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
	group = buf_newfile_acmd,
})
