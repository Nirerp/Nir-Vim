return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "pylint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>ll", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })

		vim.diagnostic.config({
			virtual_text = {
				severity = { min = vim.diagnostic.severity.WARN },
				format = function(diagnostic)
					if diagnostic.severity == vim.diagnostic.severity.ERROR then
						return "✖"
					elseif diagnostic.severity == vim.diagnostic.severity.WARN then
						return "⚠"
					else
						return ""
					end
				end,
			},
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})

		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		lint.handlers = {
			["eslint_d"] = function(errors, bufnr)
				local diagnostics = {}
				for _, error in ipairs(errors) do
					table.insert(diagnostics, {
						lnum = error.line - 1,
						col = error.col - 1,
						end_lnum = error.endLine and error.endLine - 1 or error.line - 1,
						end_col = error.endColumn or error.col,
						severity = vim.diagnostic.severity[error.severity:upper()] or vim.diagnostic.severity.ERROR,
						message = error.message,
						source = "eslint_d",
					})
				end
				vim.diagnostic.set(vim.diagnostic.get_namespace(bufnr), bufnr, diagnostics)
			end,
			["pylint"] = function(errors, bufnr)
				local diagnostics = {}
				for _, error in ipairs(errors) do
					table.insert(diagnostics, {
						lnum = error.line - 1,
						col = error.col - 1,
						end_lnum = error.endLine and error.endLine - 1 or error.line - 1,
						end_col = error.endColumn or error.col,
						severity = vim.diagnostic.severity[error.severity:upper()] or vim.diagnostic.severity.ERROR,
						message = error.message,
						source = "pylint",
					})
				end
				vim.diagnostic.set(vim.diagnostic.get_namespace(bufnr), bufnr, diagnostics)
			end,
		}

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
