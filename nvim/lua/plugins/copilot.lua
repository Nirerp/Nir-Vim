return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    dependencies = {
        "zbirenbaum/copilot-cmp",
    },
    config = function()
        require("copilot").setup({
            suggestion = {
                enabled = true,
                auto_trigger = true,
                debounce = 75,
                keymap = {
                    accept = "<Tab>",
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
    end,
}
