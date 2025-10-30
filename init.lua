-- init.lua - Configuración básica de Neovim
-- Guardar en: ~/.config/nvim/init.lua (Linux/Mac) o ~/AppData/Local/nvim/init.lua (Windows)

-- ============================================================================
-- AGREGANDO MASON AL PATH
-- ============================================================================

-- local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
-- vim.env.PATH = mason_bin .. ":" .. vim.env.PATH

-- ============================================================================
-- CONFIGURACIONES BÁSICAS
-- ============================================================================

-- Líder key (espacio es más cómodo que \ por defecto)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Números de línea
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentación
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Búsqueda
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Apariencia
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "90"
vim.opt.cursorline = true

-- Fuente (si usas un GUI de Neovim como Neovide o terminal que soporte)
vim.opt.guifont = "JetBrainsMono Nerd Font:h12"

-- Comportamiento
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.updatetime = 50

-- ============================================================================
-- INSTALACIÓN DE LAZY.NVIM (Gestor de plugins)
-- ============================================================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- ============================================================================
-- PLUGINS
-- ============================================================================

require("lazy").setup({
    -- Tema de colores (Catppuccin Mocha - estilo Monokai moderno)
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- mocha, macchiato, frappe, latte
                transparent_background = false,
                term_colors = true,
                styles = {
                    comments = { "italic" },
                    conditionals = { "italic" },
                    loops = {},
                    functions = { "bold" },
                    keywords = { "italic" },
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = { "bold" },
                    properties = {},
                    types = { "bold" },
                },
                integrations = {
                    cmp = true,
                    nvimtree = true,
                    treesitter = true,
                    telescope = true,
                    mason = true,
                },
            })
            vim.cmd([[colorscheme catppuccin]])
        end,
    },

    -- Tema alternativo: Monokai Pro
    {
        "loctvl842/monokai-pro.nvim",
        lazy = true,
        config = function()
            require("monokai-pro").setup({
                transparent_background = false,
                terminal_colors = true,
                devicons = true,
                styles = {
                    comment = { italic = true },
                    keyword = { italic = true },
                    type = { italic = true },
                    storageclass = { italic = true },
                    structure = { italic = true },
                    parameter = { italic = true },
                    annotation = { italic = true },
                    tag_attribute = { italic = true },
                },
                filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
            })
        end,
    },

    -- Explorador de archivos
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup()
        end,
    },

    -- Telescope (Buscador difuso)
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup()
        end,
    },

    -- Treesitter (Resaltado de sintaxis mejorado)
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
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
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },
            })
        end,
    },

    -- Mason (Gestor de LSP servers)
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    -- Autocompletado
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                    { name = "path" },
                }),
                experimental = {
                    ghost_text = false,
                },
            })
        end,
    },

    -- LSP Config
    {
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
    },

    -- Autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },

    -- Línea de estado
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "auto",
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    globalstatus = true,
                    refresh = {
                        statusline = 1000,
                    },
                },
                sections = {
                    lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
                    lualine_b = { "branch", "diff" },
                    lualine_c = { { "filename", path = 1 } },
                    lualine_x = { "diagnostics", "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                extensions = { "nvim-tree", "lazy" },
            })
        end,
    },

    -- Comentarios
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },

    -- Indent lines (guías visuales de indentación)
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require("ibl").setup({
                indent = {
                    char = "│",
                    tab_char = "│",
                },
                scope = { enabled = false },
                exclude = {
                    filetypes = {
                        "help",
                        "alpha",
                        "dashboard",
                        "neo-tree",
                        "Trouble",
                        "lazy",
                        "mason",
                        "notify",
                        "toggleterm",
                        "lazyterm",
                    },
                },
            })
        end,
    },

    -- Dashboard de inicio bonito
    {
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
    },

    -- Colores de colores (muestra códigos hex con su color)
    {
        "NvChad/nvim-colorizer.lua",
        event = "BufReadPre",
        config = function()
            require("colorizer").setup({
                filetypes = { "*" },
                user_default_options = {
                    RGB = true,
                    RRGGBB = true,
                    names = true,
                    RRGGBBAA = true,
                    AARRGGBB = true,
                    rgb_fn = true,
                    hsl_fn = true,
                    css = true,
                    css_fn = true,
                    mode = "background",
                    tailwind = true,
                },
            })
        end,
    },

    -- Formateador automático (null-ls alternativa)
    {
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
                    lua = { "stylua" },
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
    },

    -- Linter
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lint = require("lint")

            lint.linters_by_ft = {
                python = { "ruff" },
                javascript = { "eslint_d" },
                typescript = { "eslint_d" },
            }

            -- Ejecutar linter al guardar y al entrar al buffer
            local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
            vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
                group = lint_augroup,
                callback = function()
                    lint.try_lint()
                end,
            })
        end,
    },

    -- Debugger (DAP) - muy útil para Python
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "mfussenegger/nvim-dap-python",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup()

            -- Configurar Python debugger
            require("dap-python").setup("python3")

            -- Abrir/cerrar UI automáticamente
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            -- Atajos de teclado para debugging
            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
            vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug continue" })
            vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug step into" })
            vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Debug step over" })
            vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Debug step out" })
            vim.keymap.set("n", "<leader>dt", dapui.toggle, { desc = "Toggle debug UI" })
        end,
    },

    -- Testing con Python (pytest, unittest)
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-python",
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-python")({
                        dap = { justMyCode = false },
                        runner = "pytest",
                    }),
                },
            })

            vim.keymap.set("n", "<leader>tt", function()
                require("neotest").run.run()
            end, { desc = "Run nearest test" })

            vim.keymap.set("n", "<leader>tf", function()
                require("neotest").run.run(vim.fn.expand("%"))
            end, { desc = "Run test file" })

            vim.keymap.set("n", "<leader>ts", function()
                require("neotest").summary.toggle()
            end, { desc = "Toggle test summary" })
        end,
    },

    -- REPL interactivo para Python
    {
        "Vigemus/iron.nvim",
        config = function()
            local iron = require("iron.core")

            iron.setup({
                config = {
                    scratch_repl = true,
                    repl_definition = {
                        python = {
                            command = { "python3" },
                            format = require("iron.fts.common").bracketed_paste,
                        },
                    },
                    repl_open_cmd = require("iron.view").bottom(40),
                },
                keymaps = {
                    send_motion = "<space>sc",
                    visual_send = "<space>sc",
                    send_file = "<space>sf",
                    send_line = "<space>sl",
                    send_until_cursor = "<space>su",
                    send_mark = "<space>sm",
                    mark_motion = "<space>mc",
                    mark_visual = "<space>mc",
                    remove_mark = "<space>md",
                    cr = "<space>s<cr>",
                    interrupt = "<space>s<space>",
                    exit = "<space>sq",
                    clear = "<space>cl",
                },
                highlight = {
                    italic = true,
                },
                ignore_blank_lines = true,
            })

            vim.keymap.set("n", "<leader>rs", "<cmd>IronRepl<cr>", { desc = "Start REPL" })
            vim.keymap.set("n", "<leader>rr", "<cmd>IronRestart<cr>", { desc = "Restart REPL" })
            vim.keymap.set("n", "<leader>rf", "<cmd>IronFocus<cr>", { desc = "Focus REPL" })
            vim.keymap.set("n", "<leader>rh", "<cmd>IronHide<cr>", { desc = "Hide REPL" })
        end,
    },

    -- Snippets útiles para Python
    {
        "rafamadriz/friendly-snippets",
        event = "InsertEnter",
    }

})

-- ============================================================================
-- ATAJOS DE TECLADO
-- ============================================================================

-- Ejecutar en ventana flotante
vim.keymap.set("n", "<leader><leader>", function()
    local filetype = vim.bo.filetype
    local cmd = ""

    if filetype == "python" then
        cmd = "python3 %"
    elseif filetype == "javascript" then
        cmd = "node %"
    elseif filetype == "typescript" then
        cmd = "npx ts-node %"
    end

    vim.cmd("split | terminal " .. cmd)
    vim.cmd("resize 15") -- Altura de 15 líneas
end, { desc = "Run in floating terminal" })

-- Formatear con LSP
-- vim.keymap.set("n", "<leader>fm", function()
--     vim.lsp.buf.format({ async = false })
-- end, { desc = "Format file" })

-- formatear con conform.vim (en vez de LSP)
vim.keymap.set("n", "<leader>fm", function()
    require("conform").format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
    })
end, { desc = "Format the file and fall back to the LSP if no formatter is available." })

-- Explorador de archivos
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- Telescope
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Find in files" })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find buffers" })
vim.keymap.set("n", "<leader>ft", "/", { desc = "search in file" })

-- Navegación entre ventanas
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Ventana izquierda" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Ventana abajo" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Ventana arriba" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Ventana derecha" })

-- Guardar y salir
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Mover líneas
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Limpiar highlight de búsqueda
vim.keymap.set("n", "<Esc>", ":noh<CR>", { silent = true })
