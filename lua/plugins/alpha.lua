return {
   "goolord/alpha-nvim",
   event = "VimEnter",
   config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
         "                                                     ",
         "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
         "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
         "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
         "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
         "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
         "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
         "                                                     ",
      }

      dashboard.section.buttons.val = {
         dashboard.button("f", "  Buscar archivo", ":Telescope find_files <CR>"),
         dashboard.button("e", "  Nuevo archivo", ":ene <BAR> startinsert <CR>"),
         dashboard.button("r", "  Recientes", ":Telescope oldfiles <CR>"),
         dashboard.button("c", "  Configuración", ":e ~/.config/nvim/init.lua <CR>"),
         dashboard.button("q", "  Salir", ":qa<CR>"),
      }

      alpha.setup(dashboard.opts)
   end,
}
