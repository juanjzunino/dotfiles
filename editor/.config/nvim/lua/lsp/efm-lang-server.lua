-- Python
local python_arguments = {
  flake8 = {
    LintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"}
  },
  isort = {formatCommand = "isort --quiet -", formatStdin = true},
  yapf = {formatCommand = "yapf --quiet", formatStdin = true},
  -- black = {formatCommand = "black --quiet --stdin-filename ", formatStdin = true},
}

-- Lua
local lua_arguments = {
  luaFormat = {
    formatCommand = "lua-format -i --no-keep-simple-function-one-line --column-limit=120",
    formatStdin = true
  }
}

-- Json, Yaml
local prettier = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}

-- Formatters
require"lspconfig".efm.setup {
    cmd = {DATA_PATH .. "/lspinstall/efm/efm-langserver"},
    init_options = {documentFormatting = true, codeAction = false},
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


