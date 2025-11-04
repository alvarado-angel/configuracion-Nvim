return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			automatic_installation = true,
			ensure_installed = { "lua_ls", "ts_ls", "omnisharp", "pyright" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			-- Capabilities para nvim-cmp
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- función de keymaps
			local on_attach = function(_, bufnr)
				local opts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			end

			local lspconfig = vim.lsp.config

			-- Configuraciones (vacías, Mason autocompleta)
			lspconfig.lua_ls = {
				capabilities = capabilities,
				on_attach = on_attach,
			}

			lspconfig.pyright = {
				capabilities = capabilities,
				on_attach = on_attach,
			}

			lspconfig.ts_ls = {
				capabilities = capabilities,
				on_attach = on_attach,
			}

			lspconfig.omnisharp = {
				capabilities = capabilities,
				on_attach = on_attach,
			}
		end,
	},
}
