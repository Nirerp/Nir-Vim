return function()
	-- import lspconfig plugin
	local lspconfig = require("lspconfig")

	-- import mason_lspconfig plugin
	local mason_lspconfig = require("mason-lspconfig")

	-- import cmp-nvim-lsp plugin
	local cmp_nvim_lsp = require("cmp_nvim_lsp")

	local keymap = vim.keymap -- for conciseness

	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			-- Buffer local mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local opts = { buffer = ev.buf, silent = true }

			-- set keybinds
			opts.desc = "Show LSP references"
			keymap.set("n", "<leader>lm", "<cmd>Telescope lsp_references<CR>", opts)

			opts.desc = "Go to declaration"
			keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, opts)

			opts.desc = "Show LSP definitions"
			keymap.set("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", opts)

			opts.desc = "Show LSP implementations"
			keymap.set("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", opts)

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)

			opts.desc = "Show diagnostics/errors"
			keymap.set("n", "<leader>q", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts)

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>lx", ":LspRestart<CR>", opts)
		end,
	})

	-- used to enable autocompletion (assign to every lsp server config)
	local capabilities = cmp_nvim_lsp.default_capabilities()

	-- Add position encoding for Neovim v0.11+
	-- Use the new approach for setting position encoding
	if vim.fn.has("nvim-0.11") == 1 then
		capabilities.textDocument = capabilities.textDocument or {}
		capabilities.textDocument.positionEncoding = "utf-16"
	end

	-- Change the Diagnostic symbols in the sign column (gutter)
	local signs = { Error = "X", Warn = "", Hint = "󰋖", Info = "" }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	-- Configure LSP servers
	local servers = {
		-- Add your LSP servers here
		-- Using pyright instead of jedi_language_server to avoid conflicts
		pyright = {
			settings = {
				python = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = "workspace",
						useLibraryCodeForTypes = true,
					},
				},
			},
		},
		-- Terraform language server
		terraformls = {
			settings = {
				terraform = {
					validation = {
						enabled = true,
					},
				},
			},
		},
		-- Add other server configurations here
	}

	-- Setup mason-lspconfig
	mason_lspconfig.setup({
		ensure_installed = vim.tbl_keys(servers),
		handlers = {
			function(server_name)
				local server = servers[server_name] or {}
				server.capabilities = capabilities
				lspconfig[server_name].setup(server)
			end,
		},
	})

	require('nvim-web-devicons').setup()
end 