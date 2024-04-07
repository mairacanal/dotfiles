return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.diagnostics.checkmake,
				null_ls.builtins.diagnostics.codespell,
				null_ls.builtins.diagnostics.erb_lint,
				null_ls.builtins.diagnostics.markdownlint,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.codespell,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
			},
		})

		vim.keymap.set("n", "<leader>fb", vim.lsp.buf.format, {})
	end,
}
