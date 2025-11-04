-- ============================================================================
-- CONFIGURACIÓN BASICAS
-- ============================================================================

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

-- ============================================================================
-- CONFIGURACIÓN VISUAL DE DIAGNÓSTICOS (LSP)
-- ============================================================================

vim.diagnostic.config({
	virtual_text = {
		spacing = 4,
		prefix = function(diagnostic)
			local icons = {
				[vim.diagnostic.severity.ERROR] = " ",
				[vim.diagnostic.severity.WARN] = " ",
				[vim.diagnostic.severity.INFO] = " ",
				[vim.diagnostic.severity.HINT] = "󰌵 ",
			}
			return icons[diagnostic.severity] or "●"
		end,
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

-- ============================================================================
-- KEYMAPS DEL SISTEMA
-- ============================================================================

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
