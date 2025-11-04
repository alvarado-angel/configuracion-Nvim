-- ============================================================================
-- AGREGANDO MASON AL PATH PARA QUE ENCUENTRE LOS PATH
-- ============================================================================

local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
vim.env.PATH = mason_bin .. ":" .. vim.env.PATH

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
-- CONFIGURACIONES BÁSICAS
-- ============================================================================

require("nvim-options")

-- ============================================================================
-- PLUGINS
-- ============================================================================

require("lazy").setup("plugins")

-- ============================================================================
-- ATAJOS DE TECLADO
-- ============================================================================
