-- First read our docs (completely) then check the example_config repo
-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd[[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
  augroup END
]]

local M = {}

M.ui = {
  theme = "ayu-dark",
}

-- COLORS
vim.api.nvim_set_hl(0, "Comment", { fg = "#8a8a8a" })
vim.cmd 'hi Comment guifg=#8a8a8a'

M.plugins = require('custom.plugins')
M.mappings = require('custom.mappings')

return M
