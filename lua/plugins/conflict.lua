return {
	"akinsho/git-conflict.nvim",
	version = "*",
	config = function()
		vim.api.nvim_set_hl(0, "GitConflictCurrent", { bg = "#2e5049", fg = "NONE" })
		vim.api.nvim_set_hl(0, "GitConflictIncoming", { bg = "#344f69", fg = "NONE" })

		require("git-conflict").setup({
			default_mappings = true,
			default_commands = true,
			disable_diagnostics = false,
			highlights = {
				incoming = "GitConflictIncoming",
				current = "GitConflictCurrent",
			},
		})

		-- Ensure highlights persist after colorscheme changes
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = function()
				vim.api.nvim_set_hl(0, "GitConflictCurrent", { bg = "#2e5049", fg = "NONE" })
				vim.api.nvim_set_hl(0, "GitConflictIncoming", { bg = "#344f69", fg = "NONE" })
			end,
		})
	end,
}
