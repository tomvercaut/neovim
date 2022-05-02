local ok, lsp = pcall(require, "lspconfig")

if not ok then
  print("pcall require lspconfig failed")
  return
end

local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not ok then
  print("pcall require cmp_nvim_lsp failed")
  return
end

function lsp_enable_default_capabilities(server_name)
  local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
  lsp[server_name].setup {
    capabilities = capabilities
  }
end


