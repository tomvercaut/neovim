local has = function(x)
  return vim.fn.has(x) == 1
end

local executable = function(x)
  return vim.fn.executable(x) == 1
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

  -- nvim-telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 
      {
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons',
      } 
    },
  }

  use 'neovim/nvim-lspconfig'             -- lspconfig
  use 'hrsh7th/nvim-cmp'                  -- completion plugin
  use 'hrsh7th/cmp-buffer'                -- buffer completions
  use 'hrsh7th/cmp-path'                  -- path completions
  use 'hrsh7th/cmp-cmdline'               -- cmdline completions
  use 'hrsh7th/cmp-nvim-lsp'              -- cmp for neovim build language server client
  use 'hrsh7th/cmp-emoji'                 -- cmp for emojis
  use 'hrsh7th/cmp-nvim-lua'              -- cmp for lua
  use 'nvim-treesitter/nvim-treesitter'   -- nvim interface to parser generator / library to build 
                                          -- a syntax tree for source files
  use 'L3MON4D3/LuaSnip'                  -- completion sourece for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip'          -- snippet completions
  use 'windwp/nvim-autopairs'             -- auto close braces, brackets, ...
  
end)

