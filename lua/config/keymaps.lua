-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>to", ":split|term<CR>i", { desc = "Inicia um terminal" })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Sai do modo inserção" })
vim.keymap.set("n", "<leader>qb", ":bd<CR>:q<CR>", { desc = "Quit buffer" })
