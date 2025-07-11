return function()
  require("nvim-web-devicons").get_icon(filename, extension, options)
  require("nvim-web-devicons").setup({
    -- your personnal icons can go here (to override)
    -- you can specify color or cterm_color instead of specifying both of them
    -- DevIcon will be appended to `name`
    override = {
      ["?"] = {
        icon = "",
        color = "#6d8086",
        name = "Fallback",
      },
      unknown = {
        icon = "",
        color = "#6d8086",
        name = "Fallback",
      },
      default = {
        icon = "",
        color = "#6d8086",
        name = "Default",
      },
      zsh = {
        icon = "",
        color = "#428850",
        cterm_color = "65",
        name = "Zsh",
      },
      [".gitignore"] = {
        icon = "",
        color = "#f1502f",
        name = "Gitignore",
      },
      ["log"] = {
        icon = "",
        color = "#81e043",
        name = "Log",
      },
      ["apple"] = {
        icon = "",
        color = "#A2AAAD",
        cterm_color = "248",
        name = "Apple",
      },
    },
    -- globally enable different highlight colors per icon (default to true)
    -- if set to false all icons will have the default icon's color
    color_icons = true,
    -- globally enable default icons (default to false)
    -- will get overriden by `get_icons` option
    default = true,
    -- globally enable "strict" selection of icons - icon will be looked up in
    -- different tables, first by filename, and if not found by extension; this
    -- prevents cases when file doesn't have any extension but still gets some icon
    -- because its name happened to match some extension (default to false)
    strict = true,
    -- same as `override` but specifically for overrides by filename
    -- takes effect when `strict` is true
    override_by_filename = {},
    -- same as `override` but specifically for overrides by extension
    -- takes effect when `strict` is true
    override_by_extension = {},
    -- same as `override` but specifically for operating system
    -- takes effect when `strict` is true
    override_by_operating_system = {},
  })
end 