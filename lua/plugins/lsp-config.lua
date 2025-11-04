return {
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
				ensure_installed = { "lua_ls", "ts_ls", "omnisharp" },
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Capabilities para nvim-cmp
			local capabilities = vim.lsp.protocol.make_client_capabilities()

			-- Función que se ejecuta al adjuntar un servidor
			local on_attach = function(_, bufnr)
				local opts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			end

			local lsp = vim.lsp
			local config = lsp.config

			-- Configuraciones (vacías, Mason autocompleta)
			config.lua_ls = {
				capabilities = capabilities,
				on_attach = on_attach,
			}

			config.pyright = {
				capabilities = capabilities,
				on_attach = on_attach,
			}

			config.ts_ls = {
				capabilities = capabilities,
				on_attach = on_attach,
			}

         config.omnisharp = {
            capabilities = capabilities,
            on_attach = on_attach,
         }

			-- Iniciar los servidores registrados
			for _, server in ipairs({ "lua_ls", "ts_ls", "omnisharp" }) do
				lsp.start(config[server])
			end
		end,
	},
}
