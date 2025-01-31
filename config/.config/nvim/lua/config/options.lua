-- General
vim.o.completeopt = "menu,menuone,noselect"
vim.o.number = true
vim.o.relativenumber = true
vim.o.updatetime = 50

-- Appearance
vim.o.showmode = false
vim.o.showcmd = true
vim.o.cmdheight = 2
vim.o.cursorline = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.scrolloff = 10
vim.wo.signcolumn = "yes"
vim.o.inccommand = "split"
vim.o.mouse = vim.o.mouse .. "a"
vim.o.shortmess = vim.o.shortmess .. "c"

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = true

-- Tabs
vim.o.linebreak = true
vim.o.wrap = false
vim.bo.smartindent = true
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.expandtab = true

-- Clipboard
vim.o.clipboard = "unnamedplus"

-- Swap files
vim.o.swapfile = false
vim.o.undofile = true
vim.o.undodir = "/Users/juanjozunino/.cache"

-- Spell
vim.o.spell = false
vim.o.spelllang = "en,es"
