return {
	"Mofiqul/vscode.nvim",
	"Shatur/neovim-ayu",
	"catppuccin/nvim",
	"Mofiqul/dracula.nvim",
	"navarasu/onedark.nvim",
	"EdenEast/nightfox.nvim",
	-- tokyonight configuration
	{
		"folke/tokyonight.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = require("config.tokyonight"),
	},
	-- end of tokyonight configuration

	--[[
	####
	####
	####
	]]

	-- cyberdream configuration
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = require("config.cyberdream"),
	},
	-- end of cyberdream configuration

	-- kanagawa configuration
	{
		'rebelot/kanagawa.nvim',
		lazy = false,
		priority = 1000,
		config = require("config.kanagawa"),
	}
	-- end of kanagawa configuration
}
