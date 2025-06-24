return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-neo-tree/neo-tree.nvim",
	},
	config = require("config.nvim-lspconfig"),
}
