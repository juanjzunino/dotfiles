if not pcall(require, "nvim-treesitter") then
	return
end

require'nvim-treesitter.configs'.setup {
  ensure_installed = {'python', 'lua'},
  ignore_install = {'haskell'},
  highlight = {enable = true}
}
