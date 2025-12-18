return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Cabecera
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

        -- Ruta del init.lua cross-platform
        local config_file = vim.fn.stdpath("config") .. "/init.lua"

        -- Botones
        dashboard.section.buttons.val = {
            dashboard.button("f", "  Buscar archivo", ":Telescope find_files <CR>"),
            dashboard.button("e", "  Nuevo archivo", ":ene <BAR> startinsert <CR>"),
            dashboard.button("r", "  Recientes", ":Telescope oldfiles <CR>"),
            dashboard.button("c", "  Configuración", ":e " .. config_file .. " <CR>"),
            dashboard.button("q", "  Salir", ":qa<CR>"),
        }

        -- Configurar dashboard
        alpha.setup(dashboard.opts)
    end,
}

