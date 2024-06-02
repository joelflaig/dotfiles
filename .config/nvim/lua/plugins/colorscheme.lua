function opts()
	return {
		flavour = "mocha",
		transparent_background = true,
		term_colors = true,

		integrations = {
			dashboard = true,
			indent_blankline = {
				enabled = true,
				scope_color = "lavender",
				colored_indent_levels = false,
			},
			cmp = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
					ok = { "italic" },
				},

				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
					ok = { "underline" },
				},
				inlay_hints = {
					background = true,
				},
			},
			nvimtree = true,
			treesitter = true,
			telescope = {
				enabled = true,
				style = "nvchad"
			},
	  }
  }
end

return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,
	config = function()
		vim.cmd([[colorscheme catppuccin]])
		require("catppuccin").setup(opts())
	end
}  

