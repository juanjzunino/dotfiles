-- Help filetype detection
vim.cmd('autocmd BufRead *.md set filetype=markdown')
vim.cmd('autocmd BufRead *.tex set filetype=tex')

local nv_utils = {}

function nv_utils.define_augroups(definitions)
    -- Create autocommand groups based on the passed definitions
    -- The key will be the name of the group, and each definition
    -- within the group should have:
    --    1. Trigger
    --    2. Pattern
    --    3. Text
    -- just like how they would normally be defined from Vim itself
    for group_name, definition in pairs(definitions) do
        vim.cmd('augroup ' .. group_name)
        vim.cmd('autocmd!')

        for _, def in pairs(definition) do
            local command = table.concat(vim.tbl_flatten {'autocmd', def}, ' ')
            vim.cmd(command)
        end

        vim.cmd('augroup END')
    end
end

-- local auto_formatters = {
--   {'BufWritePre', '*.py', 'lua vim.lsp.buf.formatting(nil, 1000)'},
-- }

nv_utils.define_augroups({
    _general_settings = {
        {'TextYankPost', '*', 'lua require(\'vim.highlight\').on_yank({higroup = \'Search\', timeout = 200})'}
    },

    _auto_formatters = {
		  {'BufWritePre', '*.py', 'lua vim.lsp.buf.formatting(nil, 1000)'},
		  -- {'BufWritePre', '*.lua', 'lua vim.lsp.buf.formatting_sync(nil, 1000)'},
		}

})

