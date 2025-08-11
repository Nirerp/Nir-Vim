return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"andrew-george/telescope-themes",
	},
	cmd = "Telescope",
	config = require("config.telescope"),
}