return {
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({
            -- Disable nvim-cmp integration to use virtual text instead
            enable_cmp_source = false,
            
            -- Enable virtual text for inline suggestions
            virtual_text = {
                enabled = true,
                idle_delay = 75,
                key_bindings = {
                    accept = "<Tab>",
                    next = "<M-]>",
                    prev = "<M-[>",
                    dismiss = "<C-]>",
                }
            }
        })
        
        -- Create commands to enable, disable, and toggle Codeium
        vim.api.nvim_create_user_command("CodeiumEnable", function()
            require("codeium.config").options.virtual_text.enabled = true
            vim.notify("Codeium enabled", vim.log.levels.INFO)
        end, {})
        
        vim.api.nvim_create_user_command("CodeiumDisable", function()
            require("codeium.config").options.virtual_text.enabled = false
            vim.notify("Codeium disabled", vim.log.levels.INFO)
        end, {})
        
        vim.api.nvim_create_user_command("CodeiumToggle", function()
            local virtual_text = require("codeium.config").options.virtual_text
            virtual_text.enabled = not virtual_text.enabled
            vim.notify("Codeium " .. (virtual_text.enabled and "enabled" or "disabled"), vim.log.levels.INFO)
        end, {})
    end,
}
