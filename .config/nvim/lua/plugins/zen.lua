return {
  {
    "folke/zen-mode.nvim",
    lazy = false,
    opts = {
      window = {
        options = {
          foldcolumn = "auto:9",
        },
      },
      plugins = {
        options = {
          laststatus = 0
        },
        gitsigns = { enabled = false},
        tmux = { enabled = false },
      },
    }
  },

  {
    "folke/twilight.nvim",
    lazy = false,
    opts = {
      dimming = {
        alpha = 0.5, -- amount of dimming
      },
    },
  }
}
