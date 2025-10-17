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
				},
				handlers = {
					-- Default handler for most servers
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,

					-- Custom handler for yamlls
					yamlls = function()
						require("lspconfig").yamlls.setup({
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
							settings = {
								["helm-ls"] = {
									yamlls = {
										path = "yaml-language-server",
									},
								},
							},
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
			local lspconfig = require("lspconfig")

			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- Disable inline diagnostics
			vim.diagnostic.config({
				virtual_text = false,
				float = {
					show_header = true,
					source = "if_many",
					border = "rounded",
					focusable = false,
				},
			})

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.pyright.setup({
				capabilities = capabilities,
			})

			lspconfig.gopls.setup({
				capabilities = capabilities,
			})

			lspconfig.svelte.setup({
				capabilities = capabilities,
				-- This is because /lib file changes are otherwise not picked up automatically
				-- https://github.com/sveltejs/language-tools/issues/2008#issuecomment-1838251681
				on_attach = function(client, _)
					vim.api.nvim_create_autocmd("BufWritePost", {
						pattern = { "*.js", "*.ts" },
						callback = function(ctx)
							client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
						end,
					})
				end,
			})

			lspconfig.terraformls.setup({
				capabilities = capabilities,
			})

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.html.setup({
				capabilities = capabilities,
			})

			lspconfig.eslint.setup({
				capabilities = capabilities,
			})

			lspconfig.cssls.setup({
				capabilities = capabilities,
			})

			lspconfig.sqlls.setup({
				capabilities = capabilities,
			})

			lspconfig.prismals.setup({
				capabilities = capabilities,
			})

			lspconfig.helm_ls.setup({
				capabilities = capabilities,
				settings = {
					["helm-ls"] = {
						yamlls = {
							path = "yaml-language-server",
						},
					},
				},
			})


			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			-- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>f", vim.diagnostic.open_float, { silent = true })
		end,
	},
}
