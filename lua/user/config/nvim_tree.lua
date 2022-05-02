local ok, web_devicons = pcall(require, 'nvim-web-devicons')
if not ok then
  print("pcall require nvim-web-devicons failed")
  return
end

local ok, tree = pcall(require, 'nvim-tree')
if not ok then
  print("pcall require nvim-tree failed")
  return
end


tree.setup(
  -- log = {
  --   enable = true,
  --   truncate = true,
  --   types = {
  --     git = true,
  --     profile = true,
  --   },
  -- }
)
