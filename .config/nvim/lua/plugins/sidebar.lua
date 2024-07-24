return {
  "sidebar-nvim/sidebar.nvim",
  lazy = false,
  dependencies = {"GustavoKatel/dap-sidebar.nvim"},

  config = function ()
    local sidebar = require("sidebar-nvim")

    local opts = {
      update_interval = 100,

      sections = {
        "datetime",
        "buffers",
        "git",
        "todos",
        require("dap-sidebar-nvim.breakpoints"),
      },

      datetime = {
        icon = "",
        format = "%a %b %d, %H:%M",
        clocks = {
          { name = "local" },
          -- { name = "greenwich", offset = -1 },
          -- { name = "sydney", offset = 8 },
          -- { name = "taiwan", offset = 6 },
        }
      },

      dap = {
        breakpoints = {
          icon = ""
        }
      },

    }

    sidebar.setup(opts)
  end
}
