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



local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "?.lua")
table.insert(runtime_path, "?/init.lua")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local function dump(o)
  if type(o) == 'table' then
    local s = '{'
    for k,v in pairs(o) do
      if type(k) ~="number" then k = '"'..k..'"' end
      s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
    end
    return s ..'} '
  else
    return tostring(o)
  end
end

-- print('table: ', dump(table))
-- print('runtime_path: ', dump(runtime_path))
local sumneko_bin_path = vim.fn.exepath('lua-language-server')
local sumneko_root_path = vim.fn.fnamemodify(sumneko_bin_path, ':h:h:h')

-- print('sumneko_bin_path: ', sumneko_bin_path)
-- print('sumneko_root_path: ', sumneko_root_path)

lsp.sumneko_lua.setup({
  settings = {

    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        version = "LuaJIT",
        -- Setup the Lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize vim and use as globals
        globals = { 'vim', 'use', },
      },
      workspace = {
        -- make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true)
      },
      telemetry = {
        -- Don't send telemetry data containing a randomized but unique identifier
        enable = false,
      },
    },
  },
})

local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
lsp['sumneko_lua'].setup {
  capabilities = capabilities
}

