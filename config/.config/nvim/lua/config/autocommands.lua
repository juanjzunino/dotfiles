-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highligh-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end
})

-- Format Options
-- api.nvim_create_autocmd("BufWinEnter", {
-- 	command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
-- 	group = api.nvim_create_augroup("buf_win", { clear = true }),
-- })
--
-- api.nvim_create_autocmd("BufRead", {
-- 	command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
-- 	group = api.nvim_create_augroup("bun_win", { clear = true }),
-- })
--
-- api.nvim_create_autocmd("BufNewFile", {
-- 	command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
-- 	group = api.nvim_create_augroup("bue_newfile", { clear = true }),
-- })
