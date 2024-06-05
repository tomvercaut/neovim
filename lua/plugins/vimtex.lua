--  lazy = false,
return {
  "lervag/vimtex",
  config = function()
    vim.g.vimtex_compiler_latexmk = {
      out_dir = "out",
    }
    vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
  end,
}
