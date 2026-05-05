-- General
vim.o.completeopt = "menu,menuone,noselect" -- Completion menu, no auto-select
vim.o.number = true                         -- Show absolute line numbers
vim.o.relativenumber = true                 -- Show relative line numbers

-- Appearance
vim.o.showmode = false  -- Hide mode (handled by statusline)
vim.o.cursorline = true -- Highlight current line
vim.o.splitright = true -- Vertical splits to the right
vim.o.splitbelow = true -- Horizontal splits below
vim.o.scrolloff = 10    -- Keep context above/below cursor
-- vim.wo.signcolumn = "yes"                -- Always show sign column
-- vim.o.inccommand = "split"               -- Live preview for substitutions
vim.o.mouse = "a"                        -- Enable mouse in all modes
vim.o.shortmess = vim.o.shortmess .. "c" -- Reduce completion messages

-- Search
vim.o.ignorecase = true -- Case-insensitive search
vim.o.smartcase = true  -- Case-sensitive if uppercase present

-- Tabs
-- vim.o.linebreak = true          -- Wrap at word boundaries (if wrap enabled)
vim.o.wrap = false              -- Disable line wrapping
vim.o.smartindent = true        -- Smart autoindent
vim.o.tabstop = 4               -- Tab width
vim.o.shiftwidth = 4            -- Indent width
-- vim.o.softtabstop = 4           -- Soft tab width
vim.o.expandtab = true          -- Use spaces instead of tabs
vim.o.clipboard = "unnamedplus" -- System clipboard integration

-- Undo
vim.o.undofile = true -- Persistent undo

-- Spell
vim.o.spelllang = "en,es" -- Spell languages
