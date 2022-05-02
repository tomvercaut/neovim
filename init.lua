if require "user.bootstrap_packer"() then
  return
end

vim.g.mapleader = " "

require "user.config.options"
require "user.config.keymappings"
require "user.plugins"
require "user.config.telescope"
require "user.config.autocommands"
require "user.config.lspconfig"
require "user.config.lsp.rust"
require "user.config.lsp.sumneko_lua"
require "user.config.cmp"
require "user.config.treesitter"

