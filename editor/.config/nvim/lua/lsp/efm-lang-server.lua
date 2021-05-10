-- {{{ Python
local python_arguments = {}

-- TODO: Make it work
local flake8 = {
  LintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"}
}

local isort = {formatCommand = "isort --quiet -", formatStdin = true}

local yapf = {formatCommand = "yapf --quiet", formatStdin = true}

local black = {formatCommand = "black --quiet -", formatStdin = true}

table.insert(python_arguments, black)
table.insert(python_arguments, isort)
-- }}}

-- {{{ Lua
local lua_arguments = {}

local luaFormat = {
  formatCommand = "lua-format -i --no-keep-simple-function-one-line --column-limit=120 --indent-width=2 --tab-width=2",
  formatStdin = true
}

table.insert(lua_arguments, luaFormat)
-- }}}

-- {{{ Json, Yaml
local prettier = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}
-- }}}

-- Formatters
require"lspconfig".efm.setup {
  cmd = {DATA_PATH .. "/lspinstall/efm/efm-langserver"},
  init_options = {documentFormatting = true, codeAction = true},
  filetypes = {"lua", "python", "javascriptreact", "javascript", "sh", "html", "css", "json", "yaml", "markdown"},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      python = python_arguments,
      lua = lua_arguments,
      json = {prettier},
      yaml = {prettier},
    }
  }
}

