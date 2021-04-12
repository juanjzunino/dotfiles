require'lspconfig'.r_language_server.setup{
    cmd = { "R", "--slave", "-e", "languageserver::run()" },
    on_attach = require'lsp'.common_on_attach
}
