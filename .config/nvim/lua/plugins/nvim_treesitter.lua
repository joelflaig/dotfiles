return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = { "c", "cpp", "lua", "python", "bash", "json", "yaml", "toml" },
		matchup = {
			enable = true,
		},
    highlight = {
      disable = { "help", "man" }, -- list of language that will be disabled
    },
	}
}
