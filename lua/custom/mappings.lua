local M = {}

-- TODO: add terminal shortcuts
M.general = {
  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = {nowait = true}},
    ["jj"] = { "<ESC>", "escape insert mode", opts = {nowait = true}},
  },
  n = {
    ["<leader>fl"] = { "<cmd>HopLine<cr>", "hint lines"},
    ["<leader>fg"] = { "<cmd>HopWord<cr>", "hint words"},
    ["<leader>fp"] = { "<cmd>HopPattern<cr>", "hint pattern"},
    ["<leader>fc"] = { "<cmd>HopChar1<cr>", "hint char"},
  }
}

return M
