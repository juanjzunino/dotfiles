local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true}

-- Leader key
vim.g.mapleader = ' '

-- Disable ex mode
keymap('n', 'Q', 'Nop', {})

-- Jump to start and end of line using home row keys
keymap('', 'H', '^', {})
keymap('', 'L', '$', {})

-- Move by line
keymap('n', 'j', 'gj', opts)
keymap('n', 'k', 'gk', opts)

-- Move block up or down
keymap('x', 'K', ':move \'<-2<CR>gv-gv', opts)
keymap('x', 'J', ':move \'<+2<CR>gv-gv', opts)

-- Tab key indentation
keymap('v', '<Tab>', '>gv', opts)
keymap('v', '<S-Tab>', '<gv', opts)
keymap('v', '>', '>gv', opts)
keymap('v', '<', '<gv', opts)

-- Toggle between buffers
keymap('n', '<leader><leader>', '<c-^>', opts)

-- Unbind for tmux
keymap('', '<C-a>', '<Nop>', {})
keymap('', '<C-x>', '<Nop>', {})

-- Split panes tmux styles
keymap('n', '<Leader>-', ':sp<CR>', opts)
keymap('n', '<Leader>|', ':vsp<CR>', opts)

-- Move easily between panes
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Search
keymap('n', '<C-h>', ':nohlsearch<CR>', opts)
keymap('n', 'n', 'nzz', opts)
keymap('n', 'N', 'Nzz', opts)
keymap('n', '*', '*zz', opts)
keymap('n', '#', '#zz', opts)
keymap('n', 'g*', 'g*zz', opts)

-- Enable spell check
keymap('n', '<leader>sc', ':set spell!<CR>', opts)
