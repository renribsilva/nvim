return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          win = {
            list = {
              keys = {
                ["q"] = function()
                  -- do nothing
                end,
                ["<Esc>"] = function()
                  --Do nothing
                end,
              },
            },
          },
        },
      },
    },
  },
}
