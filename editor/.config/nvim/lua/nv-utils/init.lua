local nv_utils = {}

function nv_utils.define_augroups(definitions)
    -- Create autocommand groups based on the passed definitions
    --
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


-- function nv_utils.add_to_workspace_folder()
--     vim.lsp.buf.add_workspace_folder()
-- end

-- function nv_utils.clear_references()
--     vim.lsp.buf.clear_references()
-- end

-- function nv_utils.code_action()
--     vim.lsp.buf.code_action()
-- end

-- function nv_utils.declaration()
--     vim.lsp.buf.declaration()
--     vim.lsp.buf.clear_references()
-- end

-- function nv_utils.definition()
--     vim.lsp.buf.definition()
--     vim.lsp.buf.clear_references()
-- end

-- function nv_utils.document_highlight()
--     vim.lsp.buf.document_highlight()
-- end

-- function nv_utils.document_symbol()
--     vim.lsp.buf.document_symbol()
-- end

-- function nv_utils.formatting()
--     vim.lsp.buf.formatting()
-- end

-- function nv_utils.formatting_sync()
--     vim.lsp.buf.formatting_sync()
-- end

-- function nv_utils.hover()
--     vim.lsp.buf.hover()
-- end

-- function nv_utils.implementation()
--     vim.lsp.buf.implementation()
-- end

-- function nv_utils.incoming_calls()
--     vim.lsp.buf.incoming_calls()
-- end

-- function nv_utils.list_workspace_folders()
--     vim.lsp.buf.list_workspace_folders()
-- end

-- function nv_utils.outgoing_calls()
--     vim.lsp.buf.outgoing_calls()
-- end

-- function nv_utils.range_code_action()
--     vim.lsp.buf.range_code_action()
-- end

function nv_utils.range_formatting()
    vim.lsp.buf.range_formatting()
end

-- function nv_utils.references()
--     vim.lsp.buf.references()
--     vim.lsp.buf.clear_references()
-- end

-- function nv_utils.remove_workspace_folder()
--     vim.lsp.buf.remove_workspace_folder()
-- end

-- function nv_utils.rename()
--     vim.lsp.buf.rename()
-- end

-- function nv_utils.signature_help()
--     vim.lsp.buf.signature_help()
-- end

-- function nv_utils.type_definition()
--     vim.lsp.buf.type_definition()
-- end

-- function nv_utils.workspace_symbol()
--     vim.lsp.buf.workspace_symbol()
-- end


return nv_utils
