-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.wrap = true

-- https://vi.stackexchange.com/questions/37187/how-can-i-port-nmap-map-and-imap-commands-to-lua-configuration
local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
  map("n", shortcut, command)
end

local function imap(shortcut, command)
  map("i", shortcut, command)
end

-- Remap C-y to C-k so C-y can be
imap("<C-y>", "<C-k>")
