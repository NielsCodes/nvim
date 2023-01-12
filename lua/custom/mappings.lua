local M = {}

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

    -- LSP saga
    ["gh"] = { "<cmd>Lspsaga lsp_finder<CR>", "lsp saga" },
    ["gd"] = { "<cmd>Lspsaga peek_definition<CR>", "peek definition" },
    ["K"] = { "<cmd>Lspsaga hover_doc<CR>", "show docs" },
    ["<leader>ra"] = { "<cmd>Lspsaga rename<CR>", "rename symbol" },
    ["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>", "code actions" },
    ["]e"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "jump to next diagnostic" },
    ["[e"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "jump to previous diagnostic" },
    -- TODO: Add diagnostic jump shortcut only for errors
    ["<leader>f"] = { "<cmd>Lspsaga show_line_diagnostics<CR>", "show line diagnostics"},
    ["<leader>o"] = { "<cmd>Lspsaga outline<CR>", "toggle outline"},
    
  }
}

return M
