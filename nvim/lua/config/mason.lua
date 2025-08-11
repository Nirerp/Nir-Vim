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

	mason_lspconfig.setup({
		-- list of servers for mason to install
		ensure_installed = {
			"ts_ls",
			"html",
			"cssls",
			"tailwindcss",
			"svelte",
			"lua_ls",
			"graphql",
			"emmet_ls",
			"prismals",
			-- "jedi_language_server", -- Removed to avoid conflicts with pyright
			"gopls", -- golang language server
			"clangd",
			"pyright", -- Python LSP server
			"terraformls", -- Terraform language server
		},
	})

	mason_tool_installer.setup({
		ensure_installed = {
			"prettier", -- prettier formatter
			"stylua", -- lua formatter
			"black", -- Python formatter
			"isort", -- Python import sorter
			"pylint", -- Python linter
			"shellcheck", -- shell linter
			"clang-format", -- c and cpp formatter
			"gofumpt", -- go formatter
			"goimports", -- go imports formatter
			"golangci-lint", -- go linter
			"eslint_d", -- js linter
			"terraform-ls", -- Terraform language server
			"tflint", -- Terraform linter
			"tfsec", -- Terraform security scanner
		},
	})
end 