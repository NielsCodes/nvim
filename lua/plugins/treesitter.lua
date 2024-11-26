return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"go",
				"typescript",
				"javascript",
				"svelte",
				"lua",
				"markdown",
				"yaml",
				"css",
				"sql",
				"prisma",
				"html",
			},
			highlight = {
				enable = true,
			},
			indent = { enable = true },
		})

		vim.treesitter.language.register("html", "mjml")
	end,
}
