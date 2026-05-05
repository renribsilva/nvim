-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Bloqueia :q no explorer
_G.check_q_block = function()
  if vim.bo.filetype == "snacks_picker_list" or vim.bo.filetype == "snacks_explorer" then
    return ""
  else
    return "q"
  end
end
vim.cmd([[cnoreabbrev <expr> q v:lua.check_q_block()]])

-- Desabilita o atalho q para fechar o explorer
vim.api.nvim_create_autocmd("FileType", {
  pattern = "neo-tree",
  callback = function()
    vim.keymap.set("n", "q", "<nop>", { buffer = true, noremap = true })
  end,
})
