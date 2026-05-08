return {
  "folke/edgy.nvim",
  enabled = true,
  opts = {
    animate = {
      enabled = false,
    },
    left = {
      -- Comando para abrir dados do explorer: vim.print(Snacks.explorer.open({position = "left"}))
      {
        title = "Snacks Box",
        ft = "snacks_layout_box",
        filter = function(buf, win)
          return vim.api.nvim_win_get_config(win).relative == ""
        end,
        size = { width = 30 },
      },
    },
  },
}
