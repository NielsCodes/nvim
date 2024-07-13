return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "go", "javascript", "svelte", "lua", "markdown", "yaml" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
