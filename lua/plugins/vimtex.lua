--  lazy = false,
-- vim.g.vimtex_quickfix_ignore_filters = ["*warning*",]
return {
  "lervag/vimtex",
  config = function()
    vim.g.vimtex_compiler_silent = 1
    vim.g.vimtex_quickfix_open_on_warning = 0
    vim.g.vimtex_compiler_latexmk = {
      out_dir = "out",
    }
    vim.g.vimtex_quickfix_ignore_filters = {
      "Underfull",
      "Overfull",
    }
    vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
  end,
}
