vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Escape insert mode
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, nowait = true })
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, nowait = true })

-- Tmux navigation in insert mode
vim.keymap.set("i", "<C-h>", "<Left>", {})
vim.keymap.set("i", "<C-l>", "<Right>", {})
vim.keymap.set("i", "<C-j>", "<Down>", {})
vim.keymap.set("i", "<C-k>", "<Up>", {})

-- Tmux navigation in normal mode
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.opt.number = true
vim.opt.relativenumber = true

require("config.lazy")
