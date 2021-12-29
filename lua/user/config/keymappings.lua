-- more info on these opts: 
-- :h map-table
-- :h map-arguments
local opts = { noremap = true, silent = true }
local term_opts = { noremap = true }

-- short name for function
local keymap = vim.api.nvim_set_keymap

-- remap space as the leader key
-- initially set it the space to a no-op key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal mode --
-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts) -- jump to the window left of the current one
keymap("n", "<C-j>", "<C-w>j", opts) -- jump to the window below the current one
keymap("n", "<C-k>", "<C-w>k", opts) -- jump to the window above the current one
keymap("n", "<C-l>", "<C-w>l", opts) -- jump to the window right of the current one

-- Resize the windows with arrow
keymap("n", "<C-Left>", ":vertical resize +3<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -3<CR>", opts)
keymap("n", "<C-Up>", ":resize +3<CR>", opts)
keymap("n", "<C-Down>", ":resize -3<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down by one line
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)

-- Y yank until the end of the line
keymap("n", "Y", "y$", opts)

-- open a terminal in a vertical split
keymap("n", "<Leader>tt", ":vertical :term<CR>", opts)

-- toggle the file explorer tree
keymap("n", "<Leader>t", ":NvimTreeToggle<CR>", opts)
keymap("n", "<Leader>r", ":NvimTreeRefresh<CR>", opts)

-- telescope 
print("telescope find_files")
keymap("n", "<Leader>ff", "<cmd>lua require'telescope.builtin'.find_files()<CR>", opts)
keymap("n", "<Leader>fg", "<cmd>lua require'telescope.builtin'.live_grep()<CR>", opts)
keymap("n", "<Leader>fb", "<cmd>lua require'telescope.builtin'.buffers()<CR>", opts)
keymap("n", "<Leader>fh", "<cmd>lua require'telescope.builtin'.help_tags()<CR>", opts)


-- Insert mode --
-- Move text up and down by one line
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)


-- Visual mode --
-- Move text up and down by one line
keymap("v", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("v", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)



-- Terminal mode --
-- Window navigation
keymap("t", "<C-h>", "<C-w>h", term_opts) -- jump to the window left of the current one
keymap("t", "<C-j>", "<C-w>j", term_opts) -- jump to the window below the current one
keymap("t", "<C-k>", "<C-w>k", term_opts) -- jump to the window above the current one
keymap("t", "<C-l>", "<C-w>l", term_opts) -- jump to the window right of the current one


