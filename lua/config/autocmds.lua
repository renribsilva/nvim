-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Bloqueia :q
_G.q_block = function()
  local ft = vim.bo.filetype
  if ft == "snacks_explorer" or ft == "snacks_picker_input" or ft == "snacks_picker_list" then
    return ""
  end
  local listed_buffers = vim.fn.getbufinfo({ buflisted = 1 })
  if #listed_buffers <= 1 then
    return "enew | bd #"
  else
    return "lua Snacks.bufdelete()"
  end
end

-- Bloqueia :bd
_G.bd_block = function()
  local ft = vim.bo.filetype
  if ft == "snacks_explorer" or ft == "snacks_picker_input" or ft == "snacks_picker_list" then
    return ""
  end
  local listed_buffers = vim.fn.getbufinfo({ buflisted = 1 })
  if #listed_buffers <= 1 then
    return "enew | bd #"
  else
    return "lua Snacks.bufdelete()"
  end
end

vim.cmd([[cnoreabbrev <expr> q v:lua.q_block()]])
vim.cmd([[cnoreabbrev <expr> bd v:lua.bd_block()]])

vim.api.nvim_create_autocmd("WinEnter", {
  callback = function()
    local ft = vim.bo.filetype
    if ft == "snacks_explorer" or ft == "snacks_picker_input" or ft == "snacks_picker_list" then
      vim.keymap.set("n", "q", "<nop>", { buffer = true, silent = true })
      vim.keymap.set("n", "<Esc>", "<nop>", { buffer = true, silent = true })
      vim.keymap.set("n", "<leader>bd", "<nop>", { buffer = true, silent = true })
      vim.keymap.set("n", "<leader>bD", "<nop>", { buffer = true, silent = true })
    end
  end,
})

-- Cria um keymap para executar sucrase-node em arquivos js e ts
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "typescriptreact" },
  callback = function()
    vim.keymap.set(
      "n",
      "<localleader>b",
      ':w<CR>:split | term npx sucrase-node "%"<CR>',
      { desc = "Run JS/TS with sucrase-node", buffer = true, silent = true }
    )
  end,
})
