if require "user.bootstrap_packer"() then
  return
end

vim.g.mapleader = " "

require "user.config.options"
require "user.config.keymappings"
require "user.plugins"
require "user.config.telescope"
require "user.config.autocommands"

