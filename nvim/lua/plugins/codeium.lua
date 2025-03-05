return {
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({
            -- Use your existing API key
            api_key = "ENTER YOUR CODEIUM API KEY HERE",
            
            -- Enable virtual text for inline suggestions
            virtual_text = {
                enabled = true,
                -- These are the defaults
                manual = false,
                idle_delay = 75,
                key_bindings = {
                    accept = "<Tab>",
                    next = "<M-]>",
                    prev = "<M-[>",
                }
            }
        })
    end,
}
