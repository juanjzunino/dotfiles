-- vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- require('packer').init({display = {non_interactive = true}})
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
    -- use 'p00f/nvim-ts-rainbow'
    -- use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
    -- use 'nvim-treesitter/playground'
    -- use 'JoosepAlviste/nvim-ts-context-commentstring'
    -- use 'windwp/nvim-ts-autotag'

    -- Explorer
    use 'kyazdani42/nvim-tree.lua'

    -- Icons
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

    -- Status Line and Bufferline
    -- use 'glepnir/galaxyline.nvim'
    use 'romgrk/barbar.nvim'

    -- Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-media-files.nvim'


    -- Color
    use 'chriskempson/base16-vim'

    -- Git
    -- use 'TimUntersberger/neogit'
    -- use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    -- use 'f-person/git-blame.nvim'
    -- use 'tpope/vim-fugitive'
    -- use 'tpope/vim-rhubarb'

    -- Navigation
    -- use 'unblevable/quick-scope' -- hop may replace you
    -- use 'phaazon/hop.nvim'
    -- use 'kevinhwang91/rnvimr' -- telescope may fully replace you

    -- General Plugins
    -- use 'liuchengxu/vim-which-key'
    -- use 'kevinhwang91/nvim-bqf'
    -- use 'airblade/vim-rooter'
    -- use 'ChristianChiarulli/dashboard-nvim'
    -- use 'metakirby5/codi.vim'
    -- use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install'}
    -- use 'voldikss/vim-floaterm'
    -- use 'terrortylor/nvim-comment'
    -- use 'monaqa/dial.nvim'
    -- use 'junegunn/goyo.vim'
    -- use 'andymass/vim-matchup'
    -- use 'MattesGroeger/vim-bookmarks'
    -- use 'windwp/nvim-autopairs'
    -- use 'mbbill/undotree'

    -- Documentation Generator
    -- use {'kkoomen/vim-doge', run = ':call doge#install()'}

end)
