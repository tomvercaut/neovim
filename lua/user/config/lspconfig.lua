local ok, lsp = pcall(require, "lspconfig")

if not ok then
  print("pcall require lspconfig failed")
  return
end

local ok, completion = pcall(require, "cmp")

if not ok then
  print("pcall require cmp failed")
  return
end


