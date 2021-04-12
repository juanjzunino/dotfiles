require'nvim-treesitter.configs'.setup {
  ensure_installed = {'python',
                      'rust',
                      'go',
                      'lua',
                      'typescript',
                      'javascript',
                      'latex',
                      'bash',
                      'comment',
                      'json',
                      'yaml',
                      'toml'},
  highlight = { enable = true }
}
