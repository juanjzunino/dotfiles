if not pcall(require, "nvim-treesitter") then
	return
end

require'nvim-treesitter.configs'.setup {
  ensure_installed = {'python'},
  highlight = {enable = true}
}
