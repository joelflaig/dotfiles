return {
  'romgrk/barbar.nvim',
  lazy = false,
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function()
    vim.g.barbar_auto_setup = false
    -- highlights
    local cbg = "#222335"
    local cfg = "#89b4fa"
    local bg = "#1e1e2e"
    local fg = "#767676"
    vim.api.nvim_set_hl(0, "BufferCurrent", { bg = cbg, fg = cfg })
    vim.api.nvim_set_hl(0, "BufferAlternate", { bg = bg, fg = fg })
    vim.api.nvim_set_hl(0, "BufferInactive", { bg = bg, fg = fg })
    vim.api.nvim_set_hl(0, "BufferVisible", { bg = bg, fg = fg })
    vim.api.nvim_set_hl(0, "BufferCurrentMod", { bg = cbg, fg = cfg })
    vim.api.nvim_set_hl(0, "BufferAlternateMod", { bg = bg, fg = fg })
    vim.api.nvim_set_hl(0, "BufferInactiveMod", { bg = bg, fg = fg })
    vim.api.nvim_set_hl(0, "BufferVisibleMod", { bg = bg, fg = fg })
    vim.api.nvim_set_hl(0, "BufferCurrentSign", {fg = cbg})
    vim.api.nvim_set_hl(0, "BufferAlternateSign", {fg = bg})
    vim.api.nvim_set_hl(0, "BufferInactiveSign", {fg = bg})
    vim.api.nvim_set_hl(0, "BufferVisibleSign", {fg = bg})
  end,
  opts = {
    animation = true,
    auto_hide = false,
    tabpages = true,
    clickable = true,
    focus_on_close = 'left',
    hide = {extensions = false, inactive = false},
    highlight_alternate = false,
    highlight_inactive_file_icons = false,
    highlight_visible = false,

    icons = {
      buffer_index = false,
      buffer_number = false,
      button = '',
      diagnostics = {
        [vim.diagnostic.severity.ERROR] = {enabled = false, icon = ' '},
        [vim.diagnostic.severity.WARN] = {enabled = false, icon = ' '},
        [vim.diagnostic.severity.INFO] = {enabled = false, icon = ' '},
        [vim.diagnostic.severity.HINT] = {enabled = false, icon = '󰌶 '},
      },
      gitsigns = {
        added = {enabled = false, icon = ' '},
        changed = {enabled = false, icon = ' '},
        deleted = {enabled = false, icon = ' '},
      },
      filetype = {
        custom_colors = false,
        enabled = true,
      },
      separator = {left = '', right = ''},
      separator_at_end = false,
      modified = {button = '●'},
      pinned = {button = '', filename = true},
      preset = 'default',
      alternate = {separator = {left = '', right = ''}, filetype = {enabled = false}},
      current = {separator = {left = '', right = ''}, buffer_index = false},
      inactive = {separator = {left = '', right = ''}, button = '×'},
      visible = {separator = {left = '', right = ''}, modified = {buffer_number = false}},
    },
    insert_at_end = false,
    insert_at_start = false,
    maximum_padding = 1,
    minimum_padding = 1,
    maximum_length = 30,
    minimum_length = 0,
    semantic_letters = true,
    sidebar_filetypes = {
      NvimTree = true,
      undotree = {
        text = 'undotree',
        align = 'center',
      },
      ['neo-tree'] = {event = 'BufWipeout', text = "Explorer", align = 'center'},
      Outline = {event = 'BufWinLeave', text = 'Outline', align = 'center'},
    },

    letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
    no_name_title = nil,
  }
}
