return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.enable({
			"gopls",
			"ts_ls",
			"pyright",
			"lua_ls",
			"clangd",
		})
	end,
}
