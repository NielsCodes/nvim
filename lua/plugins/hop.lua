return {
	"phaazon/hop.nvim",
	branch = "v2",
	config = function()
		require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })

		vim.keymap.set("n", "<leader>fl", ":HopLine<CR>", {})
		vim.keymap.set("n", "<leader>fj", ":HopWord<CR>", {})
	end,
}
