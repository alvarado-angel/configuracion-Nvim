return {
   {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
         local builtin = require("telescope.builtin")
         vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
         vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find in files" })
         vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
      end,
   },
   {
      'nvim-telescope/telescope-ui-select.nvim',
      config = function()
         -- This is your opts table
         require("telescope").setup {
            extensions = {
               ["ui-select"] = {
                  require("telescope.themes").get_dropdown {
                     -- even more opts
                  }
               }
            }
         }
         require("telescope").load_extension("ui-select")
      end
   }
}
