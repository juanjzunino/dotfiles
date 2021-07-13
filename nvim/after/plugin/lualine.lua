local lualine = require('lualine')

local gruvbox = require'lualine.themes.gruvbox'
gruvbox.command.a.fg = '#282828'
gruvbox.command.a.bg = '#a89984'
gruvbox.command.c.fg = '#a89984'
gruvbox.command.c.bg = '#3c3836'

local get_lsp_client = function(msg)
  msg = msg or 'No Active Lsp'
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    return msg
	end

  for _,client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes,buf_ft) ~= -1 then
      return string.upper(client.name) .. "  "
    end
  end
  return msg
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = gruvbox,
    component_separators = {'|', '|'},
    section_separators = '',
    disabled_filetypes = {}
  },
  sections = {
		lualine_a = {
			{'mode', upper = true}
		},
    lualine_b = {
			{'branch', icon = ''}
		},
    lualine_c = {
			{'filename', file_status = true},
			{'diagnostics',  sources = {'nvim_lsp'}}
		},
    lualine_x = {
			-- get_lsp_client,
			require("lsp-status").status,
			'filetype',
		},
    lualine_y = {
			'encoding'
		},
    lualine_z = {
			'location'
		}
  },
  inactive_sections = {
    lualine_a = {'filename'},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'filetype'}
  },
  tabline = {},
  extensions = {}
}
