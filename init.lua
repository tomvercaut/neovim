-- Force the language to English
vim.api.nvim_exec("language en_US", true)
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("lspconfig").typst_lsp.setup({
  settings = {
    exportPdf = "never",
  },
})
