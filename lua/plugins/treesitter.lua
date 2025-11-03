return {
   "nvim-treesitter/nvim-treesitter",
   build = ":TSUpdate",
   config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
         ensure_installed = {
            "lua",
            "vim",
            "vimdoc",
            "python",
            "javascript",
            "typescript",
            "tsx",
            "html",
            "css",
            "json",
            "markdown",
            "markdown_inline",
            "bash",
         },
         highlight = { enable = true },
         indent = { enable = true },
         -- sync_install = false,
         -- auto_install = true
      })
   end,
}
