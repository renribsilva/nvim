return {
  {
    "R-nvim/R.nvim",
    lazy = false,
    -- Garante que o componente de sintaxe (submódulo) seja baixado automaticamente
    submodules = true,
    config = function()
      local opts = {
        -- Mapeia o Enter para enviar código ao R
        hook = {
          on_filetype = function()
            vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
            vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})
          end,
        },
        -- Não salva o ambiente de trabalho quando a sessão é encerrada
        R_args = { "--no-save", "--quiet" },
        -- Configura o mode de vizualização do console
        R_app = "Radian",
        min_editor_width = 10,
        rconsole_width = 50,
        objbr_mappings = {
          c = "class",
          ["<localleader>gg"] = "head({object}, n = 15)",
          v = function()
            require("r.browser").toggle_view()
          end,
        },
        disable_cmds = {
          "RClearConsole",
          "RCustomStart",
          "RSPlot",
          "RSaveClose",
        },
      }

      if vim.env.R_AUTO_START == "true" then
        opts.auto_start = "on startup"
        opts.objbr_auto_start = true
      end

      require("r").setup(opts)
    end,
  },
}
