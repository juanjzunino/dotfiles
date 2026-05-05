local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Disable ex mode
keymap("n", "Q", "<Nop>", {})

-- Jump to start and end of line using home row keys
keymap("", "H", "^", {})
keymap("", "L", "$", {})

-- Move by line
keymap({ "n", "v" }, "j", "gj", opts)
keymap({ "n", "v" }, "k", "gk", opts)

-- Move block up or down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Tab key indentation
keymap("v", "<Tab>", ">gv", opts)
keymap("v", "<S-Tab>", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

-- Toggle between buffers
keymap("n", "<leader><leader>", "<c-^>", opts)

-- Unbind for tmux
keymap("", "<C-a>", "<Nop>", {})
keymap("", "<C-x>", "<Nop>", {})

-- Split panes tmux styles
keymap("n", "<C-w>-", ":sp<CR>", opts)
keymap("n", "<C-w>|", ":vsp<CR>", opts)

-- Search
keymap("n", "<C-h>", ":nohlsearch<CR>", opts)
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)

-- Enable spell check
keymap("n", "<leader>sc", ":set spell!<CR>", opts)
