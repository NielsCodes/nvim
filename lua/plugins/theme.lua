return {
	"shatur/neovim-ayu",
	config = function()
		local ayu = require("ayu")
		ayu.setup({
			mirage = false,
			terminal = true,
			overrides = {},
		})
		ayu.colorscheme()

		vim.keymap.set("n", "<leader>tl", ":colorscheme ayu-light<CR>", { silent = true })
		vim.keymap.set("n", "<leader>td", ":colorscheme ayu-dark<CR>", { silent = true })
	end,
}
