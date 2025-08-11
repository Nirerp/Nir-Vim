return function()
  local illuminate = require("illuminate")

  illuminate.configure({
    providers = {
      "lsp",
      "treesitter",
      "regex",
    },
    delay = 100,
    filetypes_denylist = {
      "dirvish",
      "fugitive",
      "NvimTree",
      "neo-tree",
      "toggleterm",
      "TelescopePrompt",
      "alpha",
      "lspinfo",
      "notify",
      "noice",
      "lazy",
      "mason",
      "",
    },
    under_cursor = true,
    -- large_file_cutoff = 50000,
    -- large_file_events = { "BufReadPost", "BufNewFile" },
  })

  -- Keymaps for navigating between references
  vim.keymap.set("n", "<a-n>", function() illuminate.goto_next_reference(false) end,
    { desc = "Next Reference" })
  vim.keymap.set("n", "<a-p>", function() illuminate.goto_prev_reference(false) end,
    { desc = "Previous Reference" })
  vim.keymap.set("n", "<a-i>", function() illuminate.goto_next_reference(true) end,
    { desc = "Next Reference (wrapped)" })
  vim.keymap.set("n", "<a-o>", function() illuminate.goto_prev_reference(true) end,
    { desc = "Previous Reference (wrapped)" })
end