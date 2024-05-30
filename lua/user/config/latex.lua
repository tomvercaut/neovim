local ok, vtx = pcall(require, "vimtex")

if not ok then
  -- print("pcall require vimtex failed")
  return
end

local sysname = string.lower(vim.loop.os_uname().sysname)

-- if string.find(sysname, 'windows') then
--   -- vim.g.vimtex_cache_root = 'C:/Temp/vimtex'
--   vim.api.nvim_echo({{'OS: ' .. sysname}}, true, {})
--   -- vim.g.vimtex_cache_root = 'C:/Temp/vimtex'
-- end

vim.g.vimtex_cache_root = 'C:/Temp/vimtex'
vim.g.vimtex_cache_persistent = 1
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_compiler_latexmk = {
  build_dir='out',
}


-- vim.api.nvim_exec2(
--   [[
--   filetype plugin indent off
--   ]]
-- )

-- vim.api.nvim_exec2(
--   [[
--   syntax enable
--   ]]
-- )
