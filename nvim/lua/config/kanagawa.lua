return function()
  require('kanagawa').setup({
    colors = {
      palette = {
        -- change all usages of these colors
        sumiInk0 = "#000000",
        fujiWhite = "#FFFFFF",
      },
      theme = {
        -- change specific usages for a certain theme, or for all of them
        wave = {
          ui = {
            float = {
              bg = "none",
            },
          },
        },
        dragon = {
          syn = {
            parameter = "yellow",
          },
        },
        all = {
          ui = {
            bg_gutter = "none"
          }
        }
      }
    },
  })
end 