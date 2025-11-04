return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- config = function()
	--    require("lualine").setup({
	--       options = {
	--          theme = "auto",
	--          component_separators = { left = "", right = "" },
	--          section_separators = { left = "", right = "" },
	--          globalstatus = true,
	--          refresh = {
	--             statusline = 1000,
	--          },
	--       },
	--       sections = {
	--          lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
	--          lualine_b = { "branch", "diff" },
	--          lualine_c = { { "filename", path = 1 } },
	--          lualine_x = { "diagnostics", "encoding", "fileformat", "filetype" },
	--          lualine_y = { "progress" },
	--          lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
	--       },
	--       inactive_sections = {
	--          lualine_a = {},
	--          lualine_b = {},
	--          lualine_c = { "filename" },
	--          lualine_x = { "location" },
	--          lualine_y = {},
	--          lualine_z = {},
	--       },
	--       extensions = { "nvim-tree", "lazy" },
	--    })
	-- end,
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				globalstatus = true,
				icons_enabled = true,
				component_separators = { left = "│", right = "│" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "dashboard", "NvimTree" },
			},
			sections = {
				lualine_a = { { "mode", icon = "" } },
				lualine_b = { { "branch", icon = "" }, "diff" },
				lualine_c = {
					{ "filename", path = 1, symbols = { modified = "●", readonly = "" } },
				},
				lualine_x = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", info = " " },
					},
				},
				lualine_y = { "progress" },
				lualine_z = { { "location", icon = "" } },
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
}
