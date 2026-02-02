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

vim.keymap.set("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "Format document" })

-- git keymaps
--
vim.keymap.set("n", "]h", function()
	require("gitsigns").next_hunk()
end, { desc = "Next Git Hunk" })

vim.keymap.set("n", "[h", function()
	require("gitsigns").prev_hunk()
end, { desc = "Prev Git Hunk" })

-- vim.keymap.set("n", "<leader>hs", function()
-- 	require("gitsigns").stage_hunk()
-- end, { desc = "Stage Hunk" })
--
-- vim.keymap.set("n", "<leader>hr", function()
-- 	require("gitsigns").reset_hunk()
-- end, { desc = "Reset Hunk" })
--
-- vim.keymap.set("n", "<leader>hp", function()
-- 	require("gitsigns").preview_hunk()
-- end, { desc = "Preview Hunk" })

-- -- formatear con conform.vim (en vez de LSP)
-- vim.keymap.set("n", "<leader>fm", function()
-- 	require("conform").format({
-- 		lsp_fallback = true,
-- 		async = false,
-- 		timeout_ms = 1000,
-- 	})
-- end, { desc = "Format the file and fall back to the LSP if no formatter is available." })
