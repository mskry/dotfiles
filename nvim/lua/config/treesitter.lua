require('orgmode').setup_ts_grammar()
require("nvim-treesitter")


require('nvim-treesitter.configs').setup({
  ensure_installed = { "lua", "rust", "toml", "vue" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting= {'org'},
    ensure_installed = {'org'},
  },
  ident = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
})