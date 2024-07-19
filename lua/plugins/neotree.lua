return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			window = {
				mappings = {
					["<cr>"] = "open_with_window_picker",
					["w"] = "open",
				},
			},
			filesystem = {
				filtered_items = {
					show_hidden_count = true,
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_by_name = {
						".git",
						".DS_Store",
					},
					never_show = {},
				},
			},
		})
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal toggle<CR>", { silent = true })
		vim.keymap.set("n", "<leader>e", ":Neotree focus<CR>", { silent = true })
	end,
}
