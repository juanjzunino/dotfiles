local status_ok, nvim_treesitter = pcall(require, "nvim-treesitter.configs")

if not status_ok then
	return
end

nvim_treesitter.setup {
  ensure_installed = 'maintained',
	ignore_install = { 'haskell' },
  highlight = {
		enable = true,
		-- disable = { "yaml" },
	},
	rainbow = { enable = false },
}
