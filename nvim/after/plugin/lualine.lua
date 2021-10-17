if not pcall(require, 'lualine') then
	return
end

local lualine = require('lualine')

local get_lsp_client = function(msg)
  msg = msg or "LSP Inactive"
  local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    return msg
  end
  local lsps = ""
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      if lsps == "" then
        lsps = client.name
      else
        if not string.find(lsps, client.name) then
          lsps = lsps .. ", " .. client.name
        end
      end
    end
  end
  if lsps == "" then
    return msg
  else
    return 'LSP  : ' .. lsps
  end
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
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
			get_lsp_client,
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
