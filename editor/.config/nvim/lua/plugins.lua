local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'
require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)
  -- Packer can manage itself as an optional plugin
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use 'onsails/lspkind-nvim'
  use 'kabouzeid/nvim-lspinstall'

  -- Debugging
  use 'mfussenegger/nvim-dap'

  -- Autocomplete
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- Explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Status Line and Bufferline
  use 'romgrk/barbar.nvim'
  use 'hoob3rt/lualine.nvim'

  -- Telescope
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
  use 'nvim-telescope/telescope-media-files.nvim'

  -- Git
  -- use {'lewis6991/gitsigns.nvim'}
	-- use {"ahmedkhalf/lsp-rooter.nvim"}

  -- Icons
  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'

  -- Color
	use 'morhetz/gruvbox'
  use 'norcalli/nvim-colorizer.lua'

  -- Writing
  use 'tpope/vim-commentary'
  use 'windwp/nvim-autopairs'
  use 'godlygeek/tabular'

  -- Dashboard
  use 'glepnir/dashboard-nvim'

end)
