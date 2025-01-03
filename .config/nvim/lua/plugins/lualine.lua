-- lualine configuration

local colors = {
  blue   = '#87afff',
  cyan   = '#87d7ff',
  green  = '#afd7af',
  black  = '#262626',
	dblack = '#181825',
  white  = '#e4e4e4',
  red    = '#ff5189',
  orange = '#ffaf87',
  violet = '#d183e8',
  pink   = '#d7afd7',
  lgrey  = '#767676',
	grey   = '#4e4e4e',
  dgrey  = '#303030',
}

local padding = 0

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.blue },
    b = { fg = colors.lgrey, bg = colors.dblack },
    c = { fg = colors.lgrey },

    x = { fg = colors.lgrey },
    y = { fg = colors.lgrey, bg = colors.dblack },
    z = { fg = colors.black, bg = colors.blue},
  },

  insert = { a = { fg = colors.black, bg = colors.pink}, z = { fg = colors.black, bg = colors.pink} },
  visual = { a = { fg = colors.black, bg = colors.cyan }, z = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors. orange}, z = { fg = colors.black, bg = colors. orange} },
  command = { a = { fg = colors.black, bg = colors.green }, z = { fg = colors.black, bg = colors.green } },

  inactive = {
    a = { fg = colors.white },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white, bg = colors.black },
    x = { fg = colors.white, bg = colors.black },
    y = { fg = colors.white, bg = colors.black },
    z = { fg = colors.white },
  },
}

local function macro()
  local reg = vim.fn.reg_recording()
  if reg == "" then
    return ""
	end
  return " " .. reg
end

local function shortmode ()
	local mode = vim.api.nvim_get_mode()["mode"]
	if mode == "n" then
    return "󰀘 N"
	elseif mode == "i" then
    return " I"
	elseif mode == "v" then
    return "󰙒 V"
	elseif mode == "" then
    return "󰙒 VB"
	elseif mode == "V" then
    return "󰙒 VL"
	elseif mode == "R" then
    return " R"
	elseif mode == "c" then
    return " C"
	elseif mode == "t" then
    return " T"
	else
    return " ?"
  end
end

local function splitunixpath(inputstr)
  local sep = "/"
  local t = {}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end

-- for windows (??)
local function splitwindowspath(inputstr)
	local sep = "\\"
  local t = {}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end

local function path ()
	local p = vim.api.nvim_buf_get_name(0)
	p = splitunixpath(p) -- only unix
	-- path = splitwindowspath(p) -- only windows
	return p[#p-2] .. "/" .. table.concat(p, "/", #p-1, #p)
	-- return table.concat(p, "\", #p-1, #p) -- windows (??)
end

local function space()
  return " "
end

local seps = { left = '', right = '' }

return {
	'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
	lazy = false,

	opts = {

    options = {
      theme = bubbles_theme,
      section_separators = { left = '', right = '' },
    },

    sections = {

      lualine_a = {
        {
          shortmode, separator = { left = '', right = ' ' },

          padding = 0,
        },
        {
          macro, icon = ' ', separator = seps,

          padding = padding,
        },
      },

      lualine_b = {
        {
          'branch', icon = '',
          separator = seps,

          padding = 0,
        },
        {space, padding = 0},
        {
          'diff',
          colored = true,
          diff_color = {
            added = { fg = colors.green },
            modified = { fg = colors.orange },
            removed = { fg = colors.red },
          },
          symbols = { added = ' ', modified = ' ', removed = ' ' },
          separator = seps,

          padding = 0,
        },
      },

      lualine_c = {
        '%=',
        {
          function()
            return ' '
          end,
          separator = { left = '' },

          padding = padding,
        },
        {
          path, icon = '', separator = seps,

          padding = padding,
        },
        {
          function()
            return ' '
          end,
          separator = { right = '' },

          padding = padding,
        },
      },

      lualine_x = {
        {
          function ()
            local lsp = vim.lsp.get_clients({
              bufnr = 0
            })
            return lsp[1].name .. ""
          end,
          icon = '',

          padding = 1
        },
        {
          'diagnostics',
          sources = { 'nvim_diagnostic' },
          symbols = { error = ' ', warn = ' ', info = ' ' },
          diagnostics_color = {
            color_error = { fg = colors.red },
            color_warn = { fg = colors.yellow },
            color_info = { fg = colors.cyan },
          },

          separator = { left = ' ' },

          padding = padding,
        },
      },

      lualine_y = {
        {
          'filetype',
          padding = padding,
          separator = { left = ' ' },
        },
      },

      lualine_z = {
        {
          function()
            return vim.fn.line '.'
          end,
          separator = { left = ' ', right = '' },

          padding = 0,
        },
      },

    },

    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },

    tabline = {},
    extensions = {},
  }
}

