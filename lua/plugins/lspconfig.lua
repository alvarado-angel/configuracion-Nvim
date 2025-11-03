return {
   "neovim/nvim-lspconfig",
   event = { "BufReadPre", "BufNewFile" },
   dependencies = {
      "williamboman/mason.nvim",
      "hrsh7th/cmp-nvim-lsp",
   },
   config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      -- Configurar capabilities con protección
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

      -- Configuración común para todos los LSP
      local on_attach = function(client, bufnr)
         -- Keymaps solo para buffers con LSP activo
         local opts = { noremap = true, silent = true, buffer = bufnr }
         vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
         vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
         vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
         vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
         vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      end

      -- Usar la nueva API vim.lsp.config si está disponible (Neovim 0.11+)
      if vim.lsp.config then
         -- Nueva API de Neovim 0.11+
         vim.lsp.config('lua_ls', {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
               Lua = {
                  runtime = { version = "LuaJIT" },
                  diagnostics = { globals = { "vim" } },
                  workspace = {
                     library = vim.api.nvim_get_runtime_file("", true),
                     checkThirdParty = false,
                  },
                  telemetry = { enable = false },
               },
            },
         })

         vim.lsp.config('pyright', {
            capabilities = capabilities,
            on_attach = on_attach,
         })

         vim.lsp.config('ts_ls', {
            capabilities = capabilities,
            on_attach = on_attach,
         })

         -- Habilitar automáticamente los servidores
         vim.lsp.enable({ 'lua_ls', 'pyright', 'ts_ls' })
      else
         -- API antigua para versiones anteriores
         local lspconfig = require("lspconfig")

         lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
               Lua = {
                  runtime = { version = "LuaJIT" },
                  diagnostics = { globals = { "vim" } },
                  workspace = {
                     library = vim.api.nvim_get_runtime_file("", true),
                     checkThirdParty = false,
                  },
                  telemetry = { enable = false },
               },
            },
         })

         lspconfig.pyright.setup({
            capabilities = capabilities,
            on_attach = on_attach,
         })

         lspconfig.ts_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
         })
      end
   end,
}
