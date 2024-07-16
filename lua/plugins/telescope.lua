local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
			vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
			vim.keymap.set("n", "<leader>fm", builtin.marks, {})
			vim.keymap.set("n", "gr", builtin.lsp_references, {})
			vim.keymap.set("n", "gi", builtin.lsp_implementations, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						n = {
							["<C-g>"] = actions.send_selected_to_qflist + actions.open_qflist,
							-- TODO: Figure out why these do not work
							--
							-- ["<leader>ff"] = builtin.find_files,
							-- ["<leader>fo"] = builtin.oldfiles,
							-- ["<leader>fw"] = builtin.live_grep,
							-- ["<leader>fb"] = builtin.buffers,
							-- ["<leader>fh"] = builtin.help_tags,
							-- ["<leader>fm"] = builtin.marks,
							-- ["gr"] = builtin.lsp_references,
							-- ["gi"] = builtin.lsp_implementations,
						},
						i = {},
					},
					layout_config = {
						prompt_position = "top",
					},
					sorting_strategy = "ascending",
				},
				pickers = {
					find_files = {
						hidden = true,
						no_ignore = true,
						-- TODO: Find a better way of managing this sometime
						find_command = {
							"rg",
							"--files",
							"--hidden",
							"--glob",
							"!.git",
							"--glob",
							"!node_modules",
							"--glob",
							"!.svelte-kit",
							"--glob",
							"!.terraform",
							"--glob",
							"!build",
						},
						file_ignore_patterns = {
							".git/",
							"node_modules/",
							"%.svelte%-kit/",
							".terraform/",
							"build/",
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("fzf")
		end,
	},
}
