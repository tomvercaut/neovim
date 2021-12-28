if require "user.bootstrap_packer"() then
  return
end

vim.g.mapleader = " "

require "user.config.general_options"
require "user.plugins"

