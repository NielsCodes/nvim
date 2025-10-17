return {
	{
		"towolf/vim-helm",
		ft = "helm",
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"gopls",
					"ts_ls",
					"eslint",
					"html",
					"cssls",
					"svelte",
					"sqlls",
					"prismals",
					"pyright",
					"helm_ls",
					"yamlls",
					"terraformls",
				},
				handlers = {
					-- Default handler for most servers
					function(server_name)
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
						})
					end,

					-- Custom handler for yamlls
					yamlls = function()
						require("lspconfig").yamlls.setup({
							capabilities = capabilities,
							on_attach = function(client, bufnr)
								-- Check if current buffer is a helm file
								if vim.bo[bufnr].filetype == "helm" then
									-- Detach yamlls from helm files
									vim.schedule(function()
										vim.cmd("LspStop ++force yamlls")
									end)
									return
								end
								-- Continue with normal setup for non-helm files
							end,
							settings = {
								yaml = {
									validate = false,
									schemaStore = {
										enable = false,
									},
									schemas = {},
									format = {
										enable = false,
									},
									hover = false,
									completion = false,
								},
							},
						})
					end,

					helm_ls = function()
						require("lspconfig").helm_ls.setup({
							capabilities = capabilities,
							settings = {
								["helm-ls"] = {
									yamlls = {
										path = "yaml-language-server",
									},
								},
							},
						})
					end,

					svelte = function()
						require("lspconfig").svelte.setup({
							capabilities = capabilities,
							on_attach = function(client, _)
								vim.api.nvim_create_autocmd("BufWritePost", {
									pattern = { "*.js", "*.ts" },
									callback = function(ctx)
										client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
									end,
								})
							end,
						})
					end,
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		version = "*",
		dependencies = {
			"towolf/vim-helm",
		},
		config = function()
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			-- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>f", vim.diagnostic.open_float, { silent = true })
		end,
	},
}
