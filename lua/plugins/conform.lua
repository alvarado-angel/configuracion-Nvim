return {
   "stevearc/conform.nvim",
   event = { "BufReadPre", "BufNewFile" },
   config = function()
      require("conform").setup({
         formatters_by_ft = {
            python = { "black", "isort" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
         },
         format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
         },
      })

      -- Atajo para formatear manualmente
      vim.keymap.set({ "n", "v" }, "<leader>mp", function()
         require("conform").format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 500,
         })
      end, { desc = "Format file or range" })
   end,
}
