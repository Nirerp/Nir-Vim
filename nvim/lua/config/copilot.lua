return function()
	require("copilot").setup({
		suggestion = {
			enabled = true,
			auto_trigger = true,
			debounce = 75,
			keymap = {
				accept = false,
				accept_word = false,
				accept_line = false,
				next = "<M-]>",
				prev = "<M-[>",
				dismiss = "<C-]>",
			},
		},
		panel = {
			enabled = true,
			auto_refresh = true,
		},
		filetypes = {
			-- Enable for all filetypes
			["*"] = true,
		},
	})
	
	-- Create a custom Tab mapping that checks for Copilot suggestions
	local function has_words_before()
		if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
			return false
		end
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
	end
	
	-- Custom Tab mapping
	vim.keymap.set('i', '<Tab>', function()
		local copilot_suggestion = require("copilot.suggestion")
		if copilot_suggestion.is_visible() then
			copilot_suggestion.accept()
		else
			-- If no suggestion is visible, send a regular Tab
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
		end
	end, { silent = true })
	
	-- Create commands to enable, disable, and toggle Copilot
	vim.api.nvim_create_user_command("CopilotEnable", function()
		vim.cmd("Copilot enable")
		vim.notify("Copilot enabled", vim.log.levels.INFO)
	end, {})
	
	vim.api.nvim_create_user_command("CopilotDisable", function()
		vim.cmd("Copilot disable")
		vim.notify("Copilot disabled", vim.log.levels.INFO)
	end, {})
	
	vim.api.nvim_create_user_command("CopilotToggle", function()
		vim.cmd("Copilot toggle")
		vim.notify("Copilot toggled", vim.log.levels.INFO)
	end, {})
end