return function(_, opts)
	local telescope = require("telescope")
	telescope.setup(opts)

	-- load extensions
	for _, ext in ipairs(opts.extensions_list) do
		telescope.load_extension(ext)
	end
end 