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
vim.opt.scrolloff = 7
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

-- vim.diagnostic.config({
-- 	virtual_text = {
-- 		spacing = 4,
-- 		prefix = function(diagnostic)
-- 			local icons = {
-- 				[vim.diagnostic.severity.ERROR] = " ",
-- 				[vim.diagnostic.severity.WARN] = " ",
-- 				[vim.diagnostic.severity.INFO] = " ",
-- 				[vim.diagnostic.severity.HINT] = "󰌵 ",
-- 			}
-- 			return icons[diagnostic.severity] or "●"
-- 		end,
-- 	},
-- 	signs = true,
-- 	underline = true,
-- 	update_in_insert = false,
-- 	severity_sort = true,
-- })