vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Números de línea
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentación
vim.opt.tabstop = 3
vim.opt.softtabstop = 3
vim.opt.shiftwidth = 3
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
vim.opt.colorcolumn = "89"
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
