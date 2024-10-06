-- Package manager: Lazy  ----
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
--------

-- ENVIROMENT VARIABLES LOAD --
local function load_env()
	local config_dir = vim.fn.stdpath("config")
	local env_file = io.open(config_dir .. "/.env", "r")
	if env_file then
		for line in env_file:lines() do
			local key, value = line:match("^(%w+)%s*=%s*(.+)$")
			if key and value then
				vim.fn.setenv(key, value)
			end
		end
		env_file:close()
	end
end
load_env()

--
--

-- Load plugins and configurations
require("vim-options")
require("keymaps")
require("lazy").setup("plugins")
require("compiler")
require("python_snippets")

-- Set your colorscheme
-- load the colorscheme here
vim.cmd([[colorscheme tokyonight]])
