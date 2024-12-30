return {
	"folke/snacks.nvim",
	opts = {
		indent = {
			-- your indent configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		zen = {},
	},
	init = function()
		vim.keymap.set("n", "<leader>z", require("snacks.zen").zen, { desc = "Toggle Zen mode" })
	end,
}
