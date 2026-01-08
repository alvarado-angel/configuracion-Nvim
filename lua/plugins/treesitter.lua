return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "go", "lua", "python", "c" },
            -- Aunque la rama main tiende a lo nativo,
            -- mantenemos estas opciones para compatibilidad con plugins de terceros (como Catppuccin)
            highlight = { enable = true },
            indent = { enable = true },
        },
        config = function(_, opts)
            local ts = require("nvim-treesitter")

            -- 1. Setup inicial (instala parsers en la ruta por defecto)
            ts.setup(opts)

            -- 2. Instalación automática de los lenguajes definidos
            if opts.ensure_installed then
                ts.install(opts.ensure_installed)
            end

            -- 3. AUTOCOMANDO DINÁMICO (La clave para la v1.0.0)
            -- Esto detecta cuando abres un archivo cuyo parser ya tienes instalado
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    local lang = vim.bo[args.buf].filetype

                    -- Verificamos si hay un parser instalado para este tipo de archivo
                    local has_parser = #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".so", false) > 0
                        or #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".dll", false) > 0

                    if has_parser then
                        -- Activa resaltado nativo de Neovim
                        vim.treesitter.start(args.buf, lang)
                        -- Activa indentación de nvim-treesitter
                        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })
        end,
    },
}

