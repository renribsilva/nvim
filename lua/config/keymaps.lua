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
