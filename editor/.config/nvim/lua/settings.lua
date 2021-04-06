-- General
vim.cmd("syntax on") -- Chequear si no viene ya dado
vim.o.fileencoding = "utf-8"
vim.o.completeopt = "menuone,noselect"
vim.o.showmode       = false
vim.o.showcmd        = true
vim.o.cmdheight      = 2     -- Height of the command bar
vim.wo.number         = true  -- But show the actual number for the line we're on
vim.wo.relativenumber = true  -- Show line numbers
vim.o.hidden         = true  -- I like having buffers stay around
vim.o.cursorline     = true  -- Highlight the current line
vim.o.equalalways    = false -- I don't like my windows changing all the time
vim.o.splitright     = true  -- Prefer windows splitting to the right
vim.o.splitbelow     = true  -- Prefer windows splitting to the bottom
vim.o.updatetime     = 300   -- Make updates happen faster
vim.o.scrolloff      = 10    -- Make it so there are always ten lines below my cursor
vim.wo.colorcolumn    = "80"    -- Comment
vim.wo.signcolumn     = "yes"
vim.o.belloff        = 'all' -- Just turn the dang bell off
vim.o.inccommand     = 'split'
vim.o.mouse          = vim.o.mouse .. 'a'
vim.o.shortmess      = vim.o.shortmess .. "c"

-- Spell
vim.o.spell = false
-- vim.wo.spelllang = "es,en"

-- Search
vim.o.ignorecase     = true  -- Ignore case when searching...
vim.o.smartcase      = true  -- ... unless there is a capital letter in the query
vim.o.incsearch      = true  -- Makes search act like search in modern browsers
vim.o.hlsearch       = true  -- I wouldn't use this without my DoNoHL function

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
vim.o.clipboard      = 'unnamedplus'

-- set backspace=indent,eol,start
