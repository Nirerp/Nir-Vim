return function()
	-- Set keymap
	vim.keymap.set("n", "<C-n>", "<CMD>Neotree toggle<CR>", {})
	
	require("neo-tree").setup({
		-- show hidden files
		filesystem = {
			filtered_items = {
				visible = false,
				show_hidden_count = true,
				hide_dotfiles = true,
				hide_gitignored = true,
				hide_by_name = {
					-- add extension names you want to explicitly exclude
					-- '.git',
					-- '.DS_Store',
					-- 'thumbs.db',
				},
				never_show = {},
			},
		},
		default_component_configs = {
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "",
				folder_empty_open = "",
				default = "*",
			},
			git_status = {
				symbols = {
					added = "✚",
					deleted = "✖",
					modified = "",
					renamed = "󰁕",
					unstaged = "",
					staged = "",
					conflict = "",
				},
			},
		},
		document_symbols = {
			follow_cursor = true,
		},
		event_handlers = {
			{
				event = "file_opened",
				handler = function(file_path)
					-- auto close
					-- vimc.cmd("Neotree close")
					-- OR
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
		},
		renderers = {
			directory = {
				{ "indent" },
				{ "icon" },
				{ "current_filter" },
				{
					"container",
					content = {
						{ "name", zindex = 10 },
						{
							"symlink_target",
							zindex = 10,
							highlight = "NeoTreeSymbolicLinkTarget",
						},
						{ "clipboard", zindex = 10 },
						{ "diagnostics", errors_only = true, zindex = 20, align = "right" },
						{ "git_status", zindex = 20, align = "right" },
					},
				},
			},
			file = {
				{ "indent" },
				{ "icon" },
				{
					"container",
					content = {
						{
							"name",
							zindex = 10,
						},
						{
							"symlink_target",
							zindex = 10,
							highlight = "NeoTreeSymbolicLinkTarget",
						},
						{ "clipboard", zindex = 10 },
						{ "bufnr", zindex = 10 },
						{ "diagnostics", zindex = 20, align = "right" },
						{ "git_status", zindex = 20, align = "right" },
					},
				},
			},
		},
	})
end