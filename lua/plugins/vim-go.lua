return {
	"fatih/vim-go",
	ft = "go",
	build = ":GoInstallBinaries",
	config = function()
		vim.g["go_def_mapping_enabled"] = 0
		vim.g["go_doc_keywordprg_enabled"] = 0
	end,
}
