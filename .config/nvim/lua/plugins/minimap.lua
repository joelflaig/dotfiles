return {
  "Isrothy/neominimap.nvim",
  enabled = true,
  lazy = false, -- NOTE: NO NEED to Lazy load
  init = function()
    vim.opt.wrap = false -- Recommended
    vim.opt.sidescrolloff = 36 -- It's recommended to set a large value
    vim.g.neominimap = {
      auto_enable = true,
      window_border = "rounded",

      -- Width of the minimap window
      minimap_width = 23,

      -- How many columns a dot should span
      x_multiplier = 2,

      -- How many rows a dot should span
      y_multiplier = 1,

      exclude_filetypes = {
        "help",
        "dashboard",
        "",
      },

      exclude_buftypes = {
        "nofile",
        "nowrite",
        "quickfix",
        "terminal",
        "prompt",
      },
    }
  end,
}

