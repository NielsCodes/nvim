return {
	"filipdutescu/renamer.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	config = function()
		require("renamer").setup()

		vim.keymap.set("n", "<leader>rn", function()
			require("renamer").rename()
		end, { desc = "Rename symbol" })
	end,
}
