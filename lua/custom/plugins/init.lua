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
  -- ["wakatime/vim-wakatime"] = {},
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = 'nvim-lspconfig',
    config = function()
      require('null-ls').setup({
        sources = {
          require('null-ls').builtins.formatting.prettier,
          require('null-ls').builtins.formatting.stylua,
        }
      })
    end
  }
}
