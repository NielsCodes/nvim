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
  ["akinsho/git-conflict.nvim"] = {
    config = function()
      require('git-conflict').setup()
    end
  },
  ["christoomey/vim-tmux-navigator"] = {},
  ["kylechui/nvim-surround"] = {
    tag = "*",
    config = function()
      require('nvim-surround').setup()
    end
  },
  ["tpope/vim-abolish"] = {},
  ["sindrets/diffview.nvim"] = {
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require('diffview').setup({
        view = {
          merge_tool = {
            layout = "diff3_mixed"
          }
        }
      })
    end
  },
  ["glepnir/lspsaga.nvim"] = {
    branch = "main",
    config = function()
      local saga = require("lspsaga")

      saga.init_lsp_saga({
        code_action_lightbulb = {
          enable = false
        },
        rename_in_select = false
      })
    end
  },
  ["chentoast/marks.nvim"] = {
    config = function()
      require("marks").setup()
    end
  }
}
