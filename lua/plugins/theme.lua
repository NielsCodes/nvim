return {
  "shatur/neovim-ayu",
  config = function()
    local ayu = require("ayu")
    ayu.setup({
      mirage = false,
      terminal = true,
      overrides = {}
    })
    ayu.colorscheme()
  end
}
