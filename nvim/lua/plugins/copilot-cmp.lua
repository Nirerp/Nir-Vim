return {
    "zbirenbaum/copilot-cmp",
    dependencies = {
        "zbirenbaum/copilot.lua",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("copilot_cmp").setup({
            method = "getCompletionsCycling",
            formatters = {
                label = require("copilot_cmp.format").format_label_text,
                insert_text = require("copilot_cmp.format").format_insert_text,
                preview = require("copilot_cmp.format").deindent,
            },
        })
    end,
}
