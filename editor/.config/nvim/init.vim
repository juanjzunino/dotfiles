-- General
require('settings')
require('keymappings')
require('autocommands')
require('colorscheme')
require('plugins')

-- Plugins
require('nv-treesitter')
require('nv-lsp')
require('nv-compe')

--[[ Autocommands
" Prevent accidental writes to buffers that shouldn't be edited
autocmd BufRead *.orig set readonly
autocmd BufRead *.pacnew set readonly

" Help filetype detection
autocmd BufRead *.md set filetype=markdown
autocmd BufRead *.tex set filetype=tex

" Default for writing files
augroup writing
    autocmd!
    autocmd Filetype markdown,tex,txt set colorcolumn=
    autocmd Filetype markdown,tex,txt set spell
    autocmd Filetype markdown,tex,txt set wrap
augroup END

" Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
--]]
