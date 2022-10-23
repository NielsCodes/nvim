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
}
