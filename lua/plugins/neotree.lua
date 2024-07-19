local width = 40
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
			close_if_last_window = true,
			window = {
				position = "left",
				width = width,
				mappings = {
					["<cr>"] = "open_with_window_picker",
					["w"] = "open",
				},
			},
			default_component_configs = {
				file_size = {
					enabled = false,
				},
				type = {
					enabled = false,
				},
				last_modified = {
					enabled = false,
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

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "neo-tree",
			callback = function()
				vim.defer_fn(require("config.window-management").redistribute_widths, 0)
			end,
		})
	end,
}
