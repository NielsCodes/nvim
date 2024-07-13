return {
  "lewis6991/gitsigns.nvim", 
  config = function()
    require("gitsigns").setup({
      on_attach = function()
        local gitsigns = require("gitsigns")

        vim.keymap.set("n", '<leader>gb', function() gitsigns.blame_line{full=true} end)
      end
    })
  end
}
