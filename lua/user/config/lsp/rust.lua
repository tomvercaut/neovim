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


local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not ok then
  print("pcall require cmp_nvim_lsp failed")
  return
end

local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
lsp['rust_analyzer'].setup {
  capabilities = capabilities
}

