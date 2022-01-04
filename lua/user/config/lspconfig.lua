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

local on_attach = function(client, bufnr)
  local function bsk(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function bso(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  
  -- Enable completion triggered by <c-x><c-o>
  bso('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- mappings
  local opts = { noremap=true, silent=true }
  
  bsk('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  bsk('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  bsk('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  bsk('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  bsk('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  bsk('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  bsk('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  bsk('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  bsk('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  bsk('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  bsk('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  bsk('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  bsk('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  bsk('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  bsk('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  bsk('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  bsk('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conventiently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'rust_analyzer' }
for _, ilsp in ipairs(servers) do
  lsp[ilsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

