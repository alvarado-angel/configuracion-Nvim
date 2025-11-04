return {
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
		vim.cmd.colorscheme("catppuccin")
	end,
}
