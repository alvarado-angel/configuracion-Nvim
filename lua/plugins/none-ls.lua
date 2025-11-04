return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvimtools/none-ls-extras.nvim" },
	config = function()
		local null_ls = require("null-ls")
      local eslint_d = require("none-ls.diagnostics.eslint_d")
      local cpplint = require("none-ls.diagnostics.cpplint")


		null_ls.setup({
			sources = {
				-- lua
				null_ls.builtins.formatting.stylua,

				-- Angular, CSS, Flow, GraphQL, HTML, JSON, JSX, JavaScript, LESS, Markdown, SCSS, TypeScript, Vue, YAML
				null_ls.builtins.formatting.prettier,
				-- TypeScript, JavaScript
            eslint_d,

            -- C, C++
				null_ls.builtins.formatting.clang_format,
            -- C#
            null_ls.builtins.formatting.csharpier,
            -- C, C++, Java, JavaScript, JSON, Objective-C, Protobuf, C#
				cpplint,
			},
		})

		vim.keymap.set("n", "<leader>fm", function()
			vim.lsp.buf.format({ async = true })
		end, { desc = "Format document" })
	end,
}
