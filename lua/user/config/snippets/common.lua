local ok, ls = pcall(require, "luasnip")

if not ok then
  print("pcall require luasnip failed")
end

-- local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

local keymap = vim.keymap.set

-- In insert or select mode:
-- * expand the snippet
-- * move to the next item in the snippet
keymap({ "i", "s" }, "<C-K>", function ()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, {silent = true}
)

-- In insert or select mode:
-- Jumps into the previous item in the snippet
keymap({"i", "s"}, "<C-J>", function ()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, {silent = true}
)

keymap({"i"}, "<C-L>", function ()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, {silent = true}
)

ls.setup({
  keep_roots = true,
  link_roots = true,
  link_children = true,

  -- Update more often, :h events for more info.
  update_events = "TextChanged,TextChangedI",

})
