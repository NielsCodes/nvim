vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Escape insert mode
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, nowait = true })
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, nowait = true })

-- Save file
vim.keymap.set("n", "<C-s>", ":w<CR>", {})

-- Copy whole file
vim.keymap.set("n", "<C-c>", ":%y+<CR>", {})

-- Close current buffer
vim.keymap.set("n", "<leader>x", ":bd<CR>", { noremap = true, silent = true })

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

-- Open links under cursor
vim.keymap.set("n", "gx", function()
	vim.fn.jobstart({ "open", vim.fn.expand("<cfile>") }, { detach = true })
end, { silent = true })

-- Relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.keymap.set("n", "<ESC>", ":nohl<CR>", { silent = true })

-- Use system cliipboard
vim.opt.clipboard:append("unnamed")

-- Background theme. Used by themes
vim.g.background = "dark"

-- Make searching with / case insensitive, except when the query contains uppercase chars
vim.o.ignorecase = true
vim.o.smartcase = true

-- Always show the signcolumn to prevent content from jumping when signs appear and disappear
vim.opt.signcolumn = "yes"

-- Vertical split and move to new window
vim.api.nvim_set_keymap("n", "<leader>v", ":vsplit<CR><C-w>w", { noremap = true, silent = true })

-- Horizontal split and move to new window
vim.api.nvim_set_keymap("n", "<leader>s", ":split<CR><C-w>w", { noremap = true, silent = true })

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 300 })
	end,
})

vim.filetype.add({
	extension = {
		mjml = "html",
	},
})

-- Move cursor when creating a new window (such as a vsplit)
-- vim.api.nvim_create_autocmd("WinNew", {
-- 	callback = function()
-- 		vim.cmd("wincmd l")
-- 	end,
-- })

require("config.lazy")
require("config.window-management").setup()
