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

-- Load plugins and configurations
require("vim-options")
require('keymaps')
require("lazy").setup("plugins")
require("compiler")
require("python_snippets")

-- Set your colorscheme
-- load the colorscheme here
vim.cmd([[colorscheme tokyonight]])
