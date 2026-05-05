-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Navegar entre buffers com Shift + L e Shift + H
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { noremap = true, silent = true })

-- Executar sucrase-node com retorno no terminal
vim.api.nvim_set_keymap(
  "n",
  "<leader>b",
  ':w<CR>:split | term npx sucrase-node "%"<CR>',
  { noremap = true, silent = true }
)

-- Bloqueia :q no neotree
_G.check_q_block = function()
  if vim.bo.filetype == "snacks_picker_list" or vim.bo.filetype == "snacks_explorer" then
    return ""
  else
    return "q"
  end
end

-- Cria a abreviação que se reavalia TODA vez
vim.cmd([[cnoreabbrev <expr> q v:lua.check_q_block()]])
