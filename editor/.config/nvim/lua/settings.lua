-- General
vim.cmd("syntax on")
vim.o.fileencoding    = "utf-8"
vim.o.completeopt     = "menuone,noselect"
vim.wo.number         = true
vim.wo.relativenumber = true
vim.o.hidden          = true
vim.o.updatetime      = 300

-- Appearance
vim.o.showmode        = false
vim.o.showcmd         = true
vim.o.cmdheight       = 2
vim.o.cursorline      = true
vim.o.splitright      = true
vim.o.splitbelow      = true
vim.o.scrolloff       = 10
vim.wo.colorcolumn    = "80"
vim.wo.signcolumn     = "yes"
vim.o.belloff         = "all"
vim.o.inccommand      = "split"
vim.o.mouse           = vim.o.mouse .. "a"
vim.o.shortmess       = vim.o.shortmess .. "c"

-- Spell
vim.o.spell           = false

-- Search
vim.o.ignorecase      = true
vim.o.smartcase       = true
vim.o.incsearch       = true
vim.o.hlsearch        = true

-- Tabs
vim.wo.linebreak      = true
vim.wo.wrap           = false
vim.wo.foldenable     = false
vim.bo.smartindent    = true
vim.bo.tabstop        = 4
vim.bo.shiftwidth     = 4
vim.bo.softtabstop    = 4
vim.bo.expandtab      = true

-- Swap files
vim.bo.swapfile       = false

-- Clipboard
vim.o.clipboard       = 'unnamedplus'

-- TODO
-- vim.wo.spelllang = "es,en"
-- set backspace=indent,eol,start if necessary...
