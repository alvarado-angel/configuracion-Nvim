vim.keymap.set("n", "<leader>s", "<C-w>s", { desc = "Crear vista superior" })
vim.keymap.set("n", "<leader>v", "<C-w>v", { desc = "Crear vista lateral" })
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Ventana izquierda" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Ventana abajo" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Ventana arriba" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Ventana derecha" })

vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- -- ============================================================================
-- -- KEYMAPS DEL SISTEMA
-- -- ============================================================================
--
-- -- formatear con conform.vim (en vez de LSP)
-- vim.keymap.set("n", "<leader>fm", function()
-- 	require("conform").format({
-- 		lsp_fallback = true,
-- 		async = false,
-- 		timeout_ms = 1000,
-- 	})
-- end, { desc = "Format the file and fall back to the LSP if no formatter is available." })
