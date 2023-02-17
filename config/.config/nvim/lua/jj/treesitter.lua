local status_ok, nvim_treesitter = pcall(require, "nvim-treesitter.configs")

if not status_ok then
	return
end

nvim_treesitter.setup({
	ensure_installed = {"python", "rust", "go",  "c", "cpp", "lua", "vim"},
	ignore_install = { "haskell", "phpdoc" },
	highlight = { enable = true },
	rainbow = { enable = false },
})
