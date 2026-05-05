return {
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("gitsigns").setup()
		end,
	},
}
