return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          hidden = true,
          git_untracked = false,
        },
      },
      layouts = {
        sidebar = {
          layout = { width = 30, min_widht = 30, max_width = 30 },
        },
      },
    },
  },
}
