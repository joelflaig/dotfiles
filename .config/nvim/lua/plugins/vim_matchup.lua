return {
	'andymass/vim-matchup',
	lazy = false,
	opts = function()
		vim.g.matchup_matchparen_offscreen = { method = "popup" }
		return {}
	end,
}
