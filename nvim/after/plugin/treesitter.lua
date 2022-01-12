if not pcall(require, "nvim-treesitter") then
	return
end

require'nvim-treesitter.configs'.setup {
  ensure_installed = 'maintained',
	ignore_install = { 'haskell' },
  highlight = {
		enable = false,
		-- disable = { "yaml" },
	},
	rainbow = { enable = false },
}
