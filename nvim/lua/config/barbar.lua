return function()
	require("bufferline").setup({
		options = {
			mode = "tabs",
			separator_style = "slant",
			show_buffer_icons = true,
			show_tab_indicators = true,
		},
	})
end