local has = function(x)
  return vim.fn.has(x) == 1
end

local executable = function(x)
  return vim.fn.executable(executable) == 1
end

vim.api.nvim_exec(
[[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]], false
)

vim.api.nvim_exec(
[[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
]],false
)

local use = require('packer').use
require('packer').startup(function()

  use {'wbthomason/packer.nvim', opt = true }

  -- colorscheme
  use {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup()
    end,
  }

  -- status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt=true},
    -- after = 'onedark',
    config = function()
      require('lualine').setup({
        options = {
          theme = 'onedark',
        }
      }
    )
    end,
  }

  -- nvim-tree: file explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function()
      require('nvim-tree').setup()
    end,
  }
end)

-- require('packer').sync()
