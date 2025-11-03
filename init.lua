-- ============================================================================
-- AGREGANDO MASON AL PATH
-- ============================================================================

-- local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
-- vim.env.PATH = mason_bin .. ":" .. vim.env.PATH

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

-- formatear con conform.vim (en vez de LSP)
vim.keymap.set("n", "<leader>fm", function()
   require("conform").format({
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
   })
end, { desc = "Format the file and fall back to the LSP if no formatter is available." })

-- Navegación entre ventanas
vim.keymap.set("n", "<leader>s", "<C-w>s", { desc = "Crear vista superior" })
vim.keymap.set("n", "<leader>v", "<C-w>v", { desc = "Crear vista lateral" })
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
-- vim.keymap.set("n", "<Esc>", ":noh<CR>", { silent = true })
