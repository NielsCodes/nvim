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
          require('null-ls').builtins.formatting.prettierd.with({
            extra_filetypes = { "astro" }
          }),
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

      saga.setup({
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
  },
  ["stevearc/oil.nvim"] = {
    config = function()
      require('oil').setup()
    end
  },
  ["jackMort/ChatGPT.nvim"] = {
    after = "telescope.nvim",
    config = function()
      require('chatgpt').setup({
        api_key_cmd = "echo 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",
        keymaps = {
          close = {"<C-x>"}
        }
      })
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  }
}
