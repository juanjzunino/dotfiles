require'lspconfig'.r_language_server.setup{
    cmd = { "R", "--slave", "-e", "languageserver::run()" },
}
