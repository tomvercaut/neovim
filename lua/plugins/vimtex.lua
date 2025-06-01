return {
  "lervag/vimtex",
  laze = false,
  config = function()
    vim.g.vimtex_compiler_silent = 1
    vim.g.vimtex_quickfix_open_on_warning = 0
    vim.g.vimtex_indent_on_ampersands = 1
    vim.g.vimtex_compiler_latexmk = {
      out_dir = "out",
    }
    vim.g.vimtex_quickfix_ignore_filters = {
      "Underfull",
      "Overfull",
      "Unexpected alignment",
      "removing `\\gls'",
      "Package hyperref Warning: Token not allowed in a PDF string (Unicode): removing `\\gls'",
    }
    vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
  end,
}
