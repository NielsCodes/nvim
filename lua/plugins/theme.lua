return {
	"shatur/neovim-ayu",
	config = function()
		local ayu = require("ayu")
		ayu.setup({
			mirage = false,
			terminal = true,
			overrides = {
				GitConflictCurrent = { bg = "#2e5049", fg = "NONE" },
				GitConflictIncoming = { bg = "#344f69", fg = "NONE" },
				LineNr = { fg = "#5c6773" }, -- A medium gray that works for both themes
			},
		})
		ayu.colorscheme()
		vim.keymap.set("n", "<leader>tl", function()
			vim.cmd("colorscheme ayu-light")
			vim.api.nvim_set_hl(0, "GitConflictCurrent", { bg = "#2e5049", fg = "NONE" })
			vim.api.nvim_set_hl(0, "GitConflictIncoming", { bg = "#344f69", fg = "NONE" })
			vim.api.nvim_set_hl(0, "LineNr", { fg = "#828c99" }) -- Darker gray for light theme
		end, { silent = true })
		vim.keymap.set("n", "<leader>td", function()
			vim.cmd("colorscheme ayu-dark")
			vim.api.nvim_set_hl(0, "GitConflictCurrent", { bg = "#2e5049", fg = "NONE" })
			vim.api.nvim_set_hl(0, "GitConflictIncoming", { bg = "#344f69", fg = "NONE" })
			vim.api.nvim_set_hl(0, "LineNr", { fg = "#5c6773" }) -- Lighter gray for dark theme
		end, { silent = true })
	end,
}
