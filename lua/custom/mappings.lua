local M = {}

-- TODO: add terminal shortcuts
M.general = {
  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = {nowait = true}},
    ["jj"] = { "<ESC>", "escape insert mode", opts = {nowait = true}},
  },
  n = {
    -- Hop motions
    ["<leader>fl"] = { "<cmd>HopLine<cr>", "hint lines" },
    ["<leader>fj"] = { "<cmd>HopWord<cr>", "hint words" },
    ["<leader>fp"] = { "<cmd>HopPattern<cr>", "hint pattern" },
    ["<leader>fc"] = { "<cmd>HopChar1<cr>", "hint char" },

    -- Trouble
    ["<leader>uu"] = { "<cmd>TroubleToggle<cr>", "toggle Trouble panel" },
    ["<leader>ui"] = { "<cmd>TroubleToggle document_diagnostics<cr>", "toggle document Trouble panel" },

    -- Todo
    ["<leader>ii"] = { "<cmd>TodoTelescope<cr>", "show todos" },
  }
}

return M
