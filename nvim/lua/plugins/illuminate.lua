return {
	"RRethy/vim-illuminate",
	config = function()
		require("illuminate").configure({
			providers = {
				"lsp",
				-- "treesitter",  -- Disable treesitter provider to avoid the error
				"regex",
			},
			delay = 100,
			filetypes_denylist = {
				"dirvish",
				"fugitive",
				"NvimTree",
				"neo-tree",
				"toggleterm",
				"TelescopePrompt",
				"alpha",
				"lspinfo",
				"notify",
				"noice",
				"lazy",
				"mason",
				"",
			},
		})
	end,
}