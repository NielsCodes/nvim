return {
	"OXY2DEV/markview.nvim",
	lazy = false,

	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = {},

	init = function()
		vim.keymap.set("n", "<leader>mt", ":Markview splitToggle<CR>", { desc = "Toggle markview preview panel" })
	end,
}
