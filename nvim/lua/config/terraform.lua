return function()
	-- Enable terraform fmt on save
	vim.g.terraform_fmt_on_save = 1
	
	-- Enable terraform completion
	vim.g.terraform_completion_keys = 1
	
	-- Enable terraform folding
	vim.g.terraform_fold_sections = 1
	
	-- Set up autocommands for Terraform files
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "terraform", "tf", "hcl" },
		callback = function()
			-- Set specific options for Terraform files
			vim.opt_local.tabstop = 2
			vim.opt_local.shiftwidth = 2
			vim.opt_local.softtabstop = 2
			vim.opt_local.expandtab = true
			
			-- Add Terraform-specific keymaps
			local opts = { buffer = true, silent = true }
			vim.keymap.set("n", "<leader>tf", "<cmd>!terraform fmt %<CR>", 
				vim.tbl_extend("force", opts, { desc = "Format current Terraform file" }))
			vim.keymap.set("n", "<leader>tv", "<cmd>!terraform validate<CR>", 
				vim.tbl_extend("force", opts, { desc = "Validate Terraform configuration" }))
			vim.keymap.set("n", "<leader>tp", "<cmd>!terraform plan<CR>", 
				vim.tbl_extend("force", opts, { desc = "Run Terraform plan" }))
		end,
	})
end