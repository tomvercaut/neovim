if require "user.bootstrap_packer"() then
  return
end

vim.g.mapleader = " "

require "user.config.options"
require "user.config.keymappings"
require "user.config.autocommands"
require "user.plugins"

