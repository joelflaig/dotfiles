return {
  "sidebar-nvim/sidebar.nvim",
  lazy = false,
  config = function ()
    local sidebar = require("sidebar-nvim")

    local opts = {
      sections = {"datetime", "buffers", "git", "todos"},
      datetime = {
        icon = "",
        format = "%a %b %d, %H:%M",
        clocks = {
          { name = "local" },
          -- { name = "greenwich", offset = -1 },
          -- { name = "sydney", offset = 8 },
          -- { name = "taiwan", offset = 6 },
        }
      }
    }

    sidebar.setup(opts)
  end
}
