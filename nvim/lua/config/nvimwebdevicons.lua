return function()
  require("nvim-web-devicons").setup({
    -- your personal icons can go here (to override)
    -- you can specify color or cterm_color instead of specifying both of them
    -- DevIcon will be appended to `name`
    override = {
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
      log = {
        icon = "",
        color = "#81e043",
        name = "Log",
      },
      apple = {
        icon = "",
        color = "#A2AAAD",
        cterm_color = "248",
        name = "Apple",
      },
      json = {
        icon = "",
        color = "#cbcb41",
        name = "Json",
      },
      py = {
        icon = "",
        color = "#467878",
        name = "Python",
      },
    },
    -- globally enable different highlight colors per icon (default to true)
    -- if set to false all icons will have the default icon's color
    color_icons = true,
    -- globally enable default icons (default to false)
    -- will get overriden by `get_icons` option
    default = true,
  })
end 