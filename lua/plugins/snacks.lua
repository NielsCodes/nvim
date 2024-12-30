return {
	"folke/snacks.nvim",
	opts = {
		indent = {
			-- your indent configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		zen = {
			toggles = {
				dim = false,
			},
		},
		animate = {
			duration = {
				step = 20,
				total = 300,
			},
		},
		dim = {},
	},
	init = function()
		local dim_enabled = false

		vim.keymap.set("n", "<leader>z", require("snacks.zen").zen, { desc = "Toggle Zen mode" })
		vim.keymap.set("n", "<leader>d", function()
			if dim_enabled then
				require("snacks.dim").disable()
				dim_enabled = false
			else
				require("snacks.dim").enable()
				dim_enabled = true
			end
		end, { desc = "Toggle dimming" })
	end,
}
