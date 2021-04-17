local utils = require('nv-utils')

-- Prevent accidental writes to buffers that shouldn't be edited
vim.cmd('autocmd BufRead *.orig set readonly')
vim.cmd('autocmd BufRead *.pacnew set readonly')

-- Help filetype detection
vim.cmd('autocmd BufRead *.md set filetype=markdown')
vim.cmd('autocmd BufRead *.tex set filetype=tex')

-- Default for writing files
vim.api.nvim_exec([[
augroup writing
    autocmd!
    autocmd Filetype markdown,tex,txt set colorcolumn=
    autocmd Filetype markdown,tex,txt set spell
    autocmd Filetype markdown,tex,txt set wrap
augroup END]], false)

local auto_formatters = {
  -- python_autoformat =
	{'BufWritePre', '*.py', 'lua vim.lsp.buf.formatting_sync(nil, 1000)'},
}

utils.define_augroups({
    _general_settings = {
        {'TextYankPost', '*', 'lua require(\'vim.highlight\').on_yank({higroup = \'Search\', timeout = 200})'}
    },
    _auto_formatters = auto_formatters
})

