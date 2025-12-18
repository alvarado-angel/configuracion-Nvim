-- ============================================================================
-- INIT.LUA CROSS-PLATFORM
-- ============================================================================

-- Detectar sistema operativo
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"

-- ============================================================================
-- AGREGANDO MASON AL PATH
-- ============================================================================

local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
if is_windows then
    vim.env.PATH = mason_bin .. ";" .. vim.env.PATH
else
    vim.env.PATH = mason_bin .. ":" .. vim.env.PATH
end


-- ============================================================================
-- AGREGANDO mapleaders y localmapleader
-- ===========================================================================

vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

require("lazy").setup("plugins") 

-- ============================================================================
-- CONFIGURACIONES BÁSICAS Y ATAJOS DE TECLADO
-- ============================================================================

require("nvim-options") 
