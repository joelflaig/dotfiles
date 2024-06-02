-- lualine configuration

local colors = {
  blue   = '#87afff',
  cyan   = '#87d7ff',
  green  = '#afd7af',
  black  = '#262626',
	dblack = '#1c1c1c',
  white  = '#e4e4e4',
  red    = '#ff5189',
  orange = '#ffaf87',
  violet = '#d183e8',
  pink   = '#d7afd7',
  lgrey  = '#767676',
	grey   = '#4e4e4e',
  dgrey  = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.blue},
    b = { fg = colors.grey, bg = colors.dblack },
    c = { fg = colors.grey },
  },

  insert = { a = { fg = colors.black, bg = colors.pink} },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors. orange} },
  command = { a = { fg = colors.black, bg = colors.green } },

  inactive = {
    a = { fg = colors.white },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white, bg = colors.black },
  },
}

function shortmode ()
	mode = vim.api.nvim_get_mode()["mode"]
	if mode == "n" then
		return "N"
	elseif mode == "i" then
		return "I"
	elseif mode == "v" then
		return "V"
	elseif mode == "" then
		return "VB"
	elseif mode == "V" then
		return "VL"
	elseif mode == "R" then
		return "R"
	elseif mode == "c" then
		return "C"
	elseif mode == "t" then
		return "T"
	else
		return "?"
  end
end

function splitunixpath(inputstr)
  local sep = "/"
  local t = {}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end

-- for windows (??)
function splitwindowspath(inputstr)
	local sep = "\\"
  local t = {}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end

function path ()
	local path = vim.api.nvim_buf_get_name(0)
	path = splitunixpath(path) -- only unix
	-- path = splitwindowspath(path) -- only windows
	return table.concat(path, "/", #path-1, #path)
	-- return table.concat(path, "\", #path-1, #path) -- windows (??)
end

local seps = { left = ' ', right = ' ' }

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
				{ shortmode, icon = '', separator = seps },
			},

			lualine_b = {
				{ 'branch', icon = '' },
			},

			lualine_c = {
				'%=',
				{ path, icon = '', separator = seps },
				{
					'diff',
					colored = true,
					diff_color = {
						added = 'LualineDiffAdd',
						modified = 'LualineDiffChange',
						removed = 'LualineDiffDelete',
					},
					symbols = { added = ' ', modified = ' ', removed = ' ' },
					separator = seps,
				}
			},

			lualine_x = {
			  {
				  'diagnostics',
          sources = { 'nvim_diagnostic' },
          symbols = { error = ' ', warn = ' ', info = ' ' },
          diagnostics_color = {
            color_error = { fg = colors.red },
            color_warn = { fg = colors.yellow },
            color_info = { fg = colors.cyan },
					},
				}
      },

			lualine_y = { 'filetype' },

			lualine_z = {
				{
			  	function()
			  		return vim.fn.line '.'
			  	end,
					separator = seps,
        }
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


