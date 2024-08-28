--Telescope

vim.keymap.set(
	"n",
	"<leader>Nt",
	"<cmd>Telescope themes<CR>",
	{ noremap = true, silent = true, desc = "Nir-Vim Change Themes/Colorscheme" }
)

vim.keymap.set("n", "<leader>Nk", "<cmd>Telescope keymaps<CR>", { noremap = true, silent = true, desc = "Keymaps" })

vim.keymap.set(
	"n",
	"<leader>ss",
	"<cmd>Telescope current_buffer_fuzzy_find<CR>",
	{ noremap = true, silent = true, desc = "Search String" }
)

vim.keymap.set(
	"n",
	"<leader>sr",
	"<cmd>Telescope oldfiles<CR>",
	{ noremap = true, silent = true, desc = "Recent Files" }
)

vim.keymap.set(
	"n",
	"<leader>sg",
	":cd $HOME | Telescope find_files<CR>",
	{ noremap = true, silent = true, desc = "Find Files Globally" }
)

vim.keymap.set(
	"n",
	"<leader>sl",
	"<cmd>Telescope find_files cwd=.<cr>",
	{ noremap = true, silent = true, desc = "Find Files In Current Directory" }
)

-- Git Integration
vim.keymap.set("n", "<leader>Gg", "<cmd>LazyGit<CR>", { noremap = true, silent = true, desc = "Open Lazygit" })

-- Live-Server Integration
vim.keymap.set(
	"n",
	"<leader>Ls",
	"<cmd>LiveServerToggle<CR>",
	{ noremap = true, silent = true, desc = "Toggle Live-Server On/Off" }
)

-- csv related
vim.keymap.set("n", "<leader>Ca", "<cmd>RainbowAlign<CR>", { noremap = true, silent = true, desc = "Align CSV" })
vim.keymap.set("n", "<leader>Cs", "<cmd>RainbowShrink<CR>", { noremap = true, silent = true, desc = "Shrink Csv" })

-- Tabs/Buffers
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { noremap = true, silent = true, desc = "Open New Tab" })

vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { noremap = true, silent = true, desc = "Close Tab" })
vim.keymap.set("n", "<C-w>", "<cmd>tabclose<CR>", { noremap = true, silent = true, desc = "Close Tab" })

vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { noremap = true, silent = true, desc = "Next Tab" })

vim.keymap.set("n", "<A-.>", "<cmd>tabn<CR>", { noremap = true, silent = true, desc = "Next Tab" })

vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { noremap = true, silent = true, desc = "Previous Tab" })
vim.keymap.set("n", "<A-,>", "<cmd>tabp<CR>", { noremap = true, silent = true, desc = "Previous Tab" })

vim.keymap.set(
	"n",
	"<leader>tf",
	"<cmd>tabnew %<CR>",
	{ noremap = true, silent = true, desc = "Open Current Buffer In New Tab" }
)

-- Resizing --
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", {})
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", {})
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", {})
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", {})
-- window movement
vim.keymap.set("n", "<C-h>", "<C-w>h", {})
vim.keymap.set("n", "<C-j>", "<C-w>j", {})
vim.keymap.set("n", "<C-k>", "<C-w>k", {})
vim.keymap.set("n", "<C-l>", "<C-w>l", {})
-- indentation
vim.keymap.set("v", "<", "<gv", { desc = "Indent Left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent Right" })

-- Keybindings for shifting lines ----

-- Move the current line up with Shift+Up
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })

-- Move the current line down with Shift+Down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })

-- Move a block of lines up in visual mode with Shift+Up
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Move a block of lines down in visual mode with Shift+Down
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Others
vim.keymap.set("n", "<leader>;", "<cmd>Alpha<CR>", { noremap = true, silent = true, desc = "Dashboard" })

vim.keymap.set( -- Cheat Sheet
	"n",
	"<leader>cs",
	"<cmd>:e ~/.config/nvim/cheat_sheet.md<CR>",
	{ noremap = true, silent = true, desc = "Cheat-Sheet" }
)

-- Map F6 to run the current Python file in a floating terminal
vim.api.nvim_set_keymap(
	"n",
	"<F6>",
	"<cmd>lua run_file()<CR>",
	{ noremap = true, silent = true, desc = "Run/Compile File" }
)
