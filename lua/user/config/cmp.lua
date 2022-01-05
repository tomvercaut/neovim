local ok, cmp = pcall(require, 'cmp')
if not ok then
  return
end

local ok, luasnip = pcall(require, 'luasnip')
if not ok then
  return
end

local ok, autopairs = pcall(require, 'nvim-autopairs')
if not ok then
  return
end


local cmp_autopairs = autopairs.completion.cmp


cmp.setup({
  --- REQUIRED - you must specify a snippet engine
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ["C-k"] = cmp.mapping.select_prev_item(),
    ["C-j"] = cmp.mapping.select_next_item(),
    ["C-b"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["C-f"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["C-Space"] = cmp.mapping(cmp.mapping.complete(1), { "i", "c" }),
    -- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.complete(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- -- Kind icons
      -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])

      -- if entry.source.name == "cmp_tabnine" then
      --   -- if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
      --     -- menu = entry.completion_item.data.detail .. " " .. menu
      --   -- end
      --   vim_item.kind = " "
      -- end
      -- -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      -- NOTE: order matters
      vim_item.menu = ({
        -- nvim_lsp = "[LSP]",
        -- nvim_lua = "[Nvim]",
        -- luasnip = "[Snippet]",
        -- buffer = "[Buffer]",
        -- path = "[Path]",
        -- emoji = "[Emoji]",

        nvim_lsp = "",
        nvim_lua = "",
        luasnip = "",
        buffer = "",
        path = "",
        emoji = "",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "cmp_tabnine" },
    { name = "path" },
    { name = "emoji" },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  documentation = false,
})

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"
