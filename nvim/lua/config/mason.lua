return function()
	-- import mason
	local mason = require("mason")

	-- import mason-lspconfig
	local mason_lspconfig = require("mason-lspconfig")

	local mason_tool_installer = require("mason-tool-installer")

	-- enable mason and configure icons
	mason.setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "...",
				package_uninstalled = "",
			},
		},
	})

	mason_tool_installer.setup({
		ensure_installed = {
			"prettier", -- prettier formatter
			"stylua", -- lua formatter
			"ruff", -- python linter and formatter
			-- "isort", -- remove this if using ruff
			-- "black", -- remove this if using ruff
			-- "pylint", -- remove this if using ruff
			"shellcheck", -- shell linter
			"clang-format", -- c and cpp formatter
			"gofumpt", -- go formatter
			"goimports", -- go imports formatter
			"golangci-lint", -- go linter
			"eslint_d", -- js linter
		},
	})
end 