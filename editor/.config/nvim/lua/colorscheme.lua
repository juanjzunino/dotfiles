vim.o.termguicolors = true
vim.o.background    = "dark"
vim.cmd("let t_Co=256")
vim.cmd("let base16colorspace=256")
vim.cmd("colorscheme base16-gruvbox-dark-hard")
-- vim.o.termguicolors = true

-- require('colorbuddy').colorscheme('gruvbuddy')
-- require('colorizer').setup() 

-- local c = require('colorbuddy.color').colors
-- local group = require('colorbuddy.group').group

-- group.new('gotestsuccess', c.green, nil, s.bold)
-- group.new('gotestfail', c.red, nil, s.bold)

-- -- group.new('keyword', c.purple, nil, nil)

-- group.new('tspunctbracket', c.orange:light():light())

-- group.new('statuslineerror1', c.red:light():light(), g.statusline)
-- group.new('statuslineerror2', c.red:light(), g.statusline)
-- group.new('statuslineerror3', c.red, g.statusline)
-- group.new('statuslineerror3', c.red:dark(), g.statusline)
-- group.new('statuslineerror3', c.red:dark():dark(), g.statusline)

