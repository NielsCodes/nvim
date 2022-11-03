-- local overrides = require('custom.plugins.overrides')

return {
  -- Enable dashboard
  ["goolord/alpha-nvim"] = {
    disable = false,
  },

  ["phaazon/hop.nvim"] = {
    branch = 'v2',
    config = function()
      require("hop").setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
  ["wakatime/vim-wakatime"] = {},
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = 'nvim-lspconfig',
    config = function()
      require('null-ls').setup({
        sources = {
          require('null-ls').builtins.formatting.prettier,
          require('null-ls').builtins.formatting.stylua,
          require('null-ls').builtins.formatting.terraform_fmt,
        }
      })
    end
  },
  -- TODO: Implement mapping for :TodoTelescope and look into grep preview highlights
  -- TODO: Look into grep preview highlights
  ["folke/todo-comments.nvim"] = {
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require('todo-comments').setup {}
    end
  },
  ["folke/trouble.nvim"] = {
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
     require('trouble').setup {}
    end
  },
  ["nvim-treesitter/nvim-treesitter"] = {},
  ["nvim-treesitter/nvim-treesitter-context"] = {
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      require('treesitter-context').setup {}
    end
  },
  }
}
