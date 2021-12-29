vim.api.nvim_exec(
[[
  au CursorHold,CursorHoldI * checktime
]], false
)

if vim.fn.has('gui_running') then
  vim.api.nvim_exec(
  [[
    autocmd GUIEnter * set vb t_vb=
  ]],false
  )
end

