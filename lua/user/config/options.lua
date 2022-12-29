-- modifiable
--
local options = {
  fileformat = "unix",                         -- line endings are written as a newline character
  fileformats = "unix,dos",                    -- defines the EOL format that will be tried when starting a new buffer
  backup = false,                              -- create a backup file
  clipboard = "unnamedplus",                   -- allow access to the system clipboard
  hlsearch = false,                            -- don't highlight search pattern
  incsearch = true,                            -- while typing show the matching search pattern
  ignorecase = true,                           -- ignore case in search pattern
  smartcase = true,                            -- smart case
  mouse = "a",                                 -- enable mouse mode
  number = true,                               -- show line numbers
  relativenumber = true,                       -- make the line numbers relative to the current line
  undofile = true,                             -- save undo history
--  guifont = "JetBrains_Mono:h13:cANSI:qDRAFT", -- font used in graphical neovim
  guifont = "JetBrains Mono:h11:1:cANSI", -- font used in graphical neovim
  equalalways = true,                          -- all windows have the same size after splitting
  scrolloff = 5,                               -- always show 5 lines below the cursor
  visualbell = off,                            -- disable visual bell 
  belloff = all,                               -- disable the bell for all events
  expandtab = true,                            -- convert tabs into spaces
  shiftwidth = 2,                              -- number of spaces inserted for each indentation
  tabstop = 2,                                 -- insert 2 spaces for a tab
  updatetime = 300,                            -- number of milliseconds before the swap file is written to disk
  autoindent = true,                           -- copy indent from the current line when starting a new line
  cindent = true,                              -- amount of indent for a line according to the c indenting rules
  inccommand = "split",                        -- shows partial off-screen results in a preview window
  splitbelow = true,                           -- force all horizontal splits below the current window
  splitright = true,                           -- force all vertical splits right of the current window
  }

-- nvim_tree_quit_on_open = 0, 
-- nvim_tree_indent_markers = 1,
-- nvim_tree_git_hl = 1,
-- nvim_tree_create_in_closed_folder = 1,
-- nvim_tree_refresh_wait = 600,


for k, v in pairs(options) do
  vim.opt[k] = v
end

-- OS specific terminal
if vim.fn.has('win32') then
  vim.o.shell="pwsh.exe"
end

if vim.loop.os_uname().sysname == "Linux" then
  vim.o.shell="/usr/bin/bash"
end

