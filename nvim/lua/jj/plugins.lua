local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

return require('packer').startup(function(use)
  -- Packer can manage itself as an optional plugin
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use 'onsails/lspkind-nvim'
	use 'jose-elias-alvarez/null-ls.nvim'
	use 'folke/trouble.nvim'
	use 'folke/todo-comments.nvim'

  -- Autocomplete
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	use 'nvim-treesitter/playground'

	-- Explore
	use 'kyazdani42/nvim-tree.lua'

  -- Status Line and Bufferline
  use 'romgrk/barbar.nvim'
  use 'hoob3rt/lualine.nvim'

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'

  -- Git
  use 'lewis6991/gitsigns.nvim'
  -- use {"ahmedkhalf/lsp-rooter.nvim"}

  -- Icons
  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'

  -- Color
  use 'norcalli/nvim-colorizer.lua'
	use 'folke/tokyonight.nvim'

  -- Writing
  use 'tpope/vim-commentary'
  use 'windwp/nvim-autopairs'
  use 'godlygeek/tabular'
	use 'plasticboy/vim-markdown'

end)
