-- {{{ Leader key
vim.g.mapleader = ' '
-- }}}

-- {{{ Disable ex mode
vim.api.nvim_set_keymap('n', 'Q', 'Nop', {})
-- }}}

-- {{{ Jumpt to start and end of line using home row keys
vim.api.nvim_set_keymap('', 'H', '^', {})
vim.api.nvim_set_keymap('', 'L', '$', {})
-- }}}

-- {{{ Move by line
vim.api.nvim_set_keymap('n', 'j', 'gj', {noremap = true})
vim.api.nvim_set_keymap('n', 'k', 'gk', {noremap = true})
-- }}}

-- {{{ Move block up or down
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'<+1<CR>gv-gv', {noremap = true})
-- }}}

-- {{{ Tab key indentation
vim.api.nvim_set_keymap('v', '<Tab>', '>gv', {noremap = true})
vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', {noremap = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true})
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true})
-- }}}

-- {{{ Toggle between buffers
vim.api.nvim_set_keymap('n', '<leader><leader>', '<c-^>', {noremap = true})
-- }}}

-- {{{ Unbind for tmux
vim.api.nvim_set_keymap('', '<C-a>', '<Nop>', {})
vim.api.nvim_set_keymap('', '<C-x>', '<Nop>', {})
-- }}}

-- {{{ Split panes tmux styles
vim.api.nvim_set_keymap('n', '<Leader>-', ':sp<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>|', ':vsp<CR>', {noremap = true})
-- }}}

-- {{{ Move easily between panes
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true})
-- }}}

-- {{{ Search functionality
vim.api.nvim_set_keymap('n', '<C-h>', ':nohlsearch<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '?', '?\\v', {noremap = true})
vim.api.nvim_set_keymap('n', '/', '/\\v', {noremap = true})
vim.api.nvim_set_keymap('n', 'n', 'nzz', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'N', 'Nzz', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '*', '*zz', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '#', '#zz', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'g*', 'g*zz', {noremap = true, silent = true})
-- }}}

-- {{{ Enable spell check
vim.api.nvim_set_keymap('n', '<leader>sc', ':set spell!<CR>', {noremap = true})
-- }}}
