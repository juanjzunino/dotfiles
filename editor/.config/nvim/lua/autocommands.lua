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

-- " Limelight
-- autocmd! User GoyoEnter Limelight
-- autocmd! User GoyoLeave Limelight!
