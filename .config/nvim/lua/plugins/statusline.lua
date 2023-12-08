-- lua line
local colors = {
  red = '#ca1243',
  grey = '#a0a1a7',
  black = '#383a42',

  white = '#f3f3f3',
  light_green = '#83a598',
  orange = '#fe8019',
  green = '#8ec07c',
}

local theme = {
  normal = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.black, bg = colors.grey },
    c = { fg = colors.black, bg = colors.orange },
    z = { fg = colors.white, bg = colors.black },

  },
  insert = { a = { fg = colors.white, bg = colors.red } },
  visual = { a = { fg = colors.black, bg = colors.orange } },
  replace = { a = { fg = colors.black, bg = colors.green } },
}

local empty = require('lualine.component'):extend()

require('lualine').setup{
	options = {
		theme = theme,
		component_separators = '',
		section_separators = { left = '', right = '' }
	},
	sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
	lualine_c = {require('auto-session.lib').current_session_name},
    lualine_x = {},
    lualine_y = {{'filename', path=1}},
    lualine_z = {'%l:%c', '%p%%/%L'},
  }
}


