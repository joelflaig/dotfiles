return {
  "nvchad/showkeys",
  cmd = "ShowkeysToggle",
  opts = {
    timeout = 1,
    maxkeys = 5,
    position = "top-center",
    -- more opts
    keyformat = {
      ["<BS>"] = "󰭜",
      ["<CR>"] = "󱞥",
      ["<Space>"] = "󱁐",
      ["<Up>"] = "󰁝",
      ["<Down>"] = "󰁅",
      ["<Left>"] = "󰁍",
      ["<Right>"] = "󰁔",
      ["<PageUp>"] = "Pg 󰁝",
      ["<PageDown>"] = "Pg 󰁅",
      ["<M>"] = "󰘵",
      ["<C>"] = "󰘴",
      ["<Esc>"] = "󰿅",
    }
  }
}

