return function()
	-- Which-key configuration
	local wk = require("which-key")
	wk.add({
		{ "<leader>G", group = "Git" }, --
		{ "<leader>L", group = "Live-Server" },
		{ "<leader>s", group = "Search" }, --
		{ "<leader>c", group = "Check" }, --
		{ "<leader>C", group = "CSV" },
		{ "<leader>t", group = "Tabs" }, --
		{ "<leader>l", group = "LSP" }, --
		{ "<leader>N", group = "Nir-Vim" }, --

		-- Nested mappings are allowed and can b e added in any order
		-- Most attributes can be inherited or overridden on any level
		-- There's no limit to the depth of nesting
		mode = { "n", "v" }, -- NORMAL and VISUAL mode
		{ "<leader>w", "<cmd>w<cr>", desc = "Write" },
	})
end 