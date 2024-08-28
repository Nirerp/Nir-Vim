return {
	-- amongst your other plugins
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	-- or
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = { --[[ things you want to change go here]]
		},
		config = function()
			require("toggleterm").setup({
				direction = "float",
				float_opts = {
					border = "curved", -- optional, customize the border style
				},
			})
		end
	},
}
