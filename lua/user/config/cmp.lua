local ok, cmp = pcall(require, 'cmp')
if not ok then
  print("pcall require cmp failed")
  return
end

local ok, luasnip = pcall(require, 'luasnip')
if not ok then
  print("pcall require luasnip failed")
  return
end

local ok, autopairs = pcall(require, 'nvim-autopairs')
if not ok then
  print("pcall require nvim-autopairs failed")
  return
end


-- local cmp_autopairs = autopairs.completion.cmp


cmp.setup({
  --- REQUIRED - you must specify a snippet engine
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  window = {
    documentation = "native"
  },
  -- Based on README.md in https://github.com/hrsh7th/nvim-cmp
  mapping = {
    ["C-k"] = cmp.mapping.select_prev_item(),
    ["C-j"] = cmp.mapping.select_next_item(),
    ["C-b"] = cmp.mapping.scroll_docs(-4),
    ["C-f"] = cmp.mapping.scroll_docs(4),
    ["C-Space"] = cmp.mapping.complete(),
    ["C-e"] = cmp.mapping.abort(),
    ["CR"] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "nvim_lua" },
    { name = "buffer" },
    -- { name = "cmp_tabnine" },
    { name = "path" },
    -- { name = "emoji" },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  --documentation = true,
})


autopairs.setup({
})

-- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
-- cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"
