------------------------------------------------------------------------------
-- General settings that can / should be loaded before loading any plugins
------------------------------------------------------------------------------

-- set file format to unix
vim.o.modifiable = true
vim.g.fileformat = unix
vim.g.fileformats = unix,dos

-- auto reload a file if it has been changed externally
vim.o.autoread = true
vim.api.nvim_exec(
[[
  au CursorHold,CursorHoldI * checktime
]], false
)

-- disable beeping and flashing if an error occurs
vim.g.visualbell = off
vim.g.belloff = all
if vim.fn.has('gui_running') then
  vim.api.nvim_exec(
  [[
    autocmd GUIEnter * set vb t_vb=
  ]],false
  )
end

-- show the line number relative to the current selected line
vim.wo.number = true
vim.wo.relativenumber = true

-- set highlight on search, this will disable highligh after search
vim.o.hlsearch = false

-- enable mouse mode
vim.o.mouse = 'a'

-- save undo history
vim.opt.undofile = true

-- case insensitive search unless /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.guifont = "JetBrains_Mono:h13:cANSI:qDRAFT" -- font settings

vim.opt.clipboard="unnamedplus" -- System clipboard access
vim.opt.incsearch = true
--
-- all windows have the same size after 
--splitting or opening a window
vim.equalalways = true

-- make sure there are always x lines below the cursor
vim.opt.scrolloff = 10

-- Tabs
vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.wrap = true

vim.opt.inccommand = "split"


-------------------------------------------------------------------------------
-- Keybindings
-------------------------------------------------------------------------------

-- Y yank until the end of the line 
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })


-------------------------------------------------------------------------------
-- Split settings
-------------------------------------------------------------------------------
vim.o.splitbelow = true
vim.o.splitright = true

local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- remap split navigation to CTRL + hjkl
vim.api.nvim_exec(
[[
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-l> <C-w>l

tnoremap <C-h> <C-w>h
tnoremap <C-k> <C-w>k
tnoremap <C-j> <C-w>j
tnoremap <C-l> <C-w>l
]], false
)

-- make adjusting the split sizes a bit more friendely
vim.api.nvim_exec(
[[
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

tnoremap <silent> <C-Left> :vertical resize +3<CR>
tnoremap <silent> <C-Right> :vertical resize -3<CR>
tnoremap <silent> <C-Up> :resize +3<CR>
tnoremap <silent> <C-Down> :resize -3<CR>
]],false)


-- OS specific terminal
if vim.fn.has('win32') then
  vim.o.shell="pwsh.exe"
end

-- open a terminal in a vertial split
vim.api.nvim_exec(
[[
nnoremap <silent> <Leader>tt :vertical :term<CR>
]],false)



-------------------------------------------------------------------------------
-- nvim-tree: file explorer
-- global settings that must be set before loading the plugin
-------------------------------------------------------------------------------
vim.g.nvim_tree_quit_on_open = 0
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_create_in_closed_folder = 1
vim.g.nvim_tree_refresh_wait = 600

-- toggle the file explorer tree
vim.api.nvim_exec(
[[
nnoremap <silent> <Leader>t :NvimTreeToggle<CR>
nnoremap <silent> <Leader>r :NvimTreeRefresh<CR>
]],false)


