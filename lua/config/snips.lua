local ls = require("luasnip")

vim.keymap.set({ "i" }, "<C-K>", function()
  if ls.expandable() then
    ls.expand()
  end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function()
  if ls.jumbable(1) then
    ls.jump(1)
  end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function()
  if ls.jumbable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local extras = require("luasnip.extras")
-- local l = extras.lambda
-- local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require("luasnip.extras.expand_conditions")
-- local postfix = require("luasnip.extras.postfix").postfix
-- local types = require("luasnip.util.types")
-- local parse = require("luasnip.util.parser").parse_snippet
-- local ms = ls.multi_snippet
-- local k = require("luasnip.nodes.key_indexer").new_key

ls.add_snippets("tex", {
  --
  s(
    "createpreamble",
    fmt(
      [[
      \usepackage[<lang>]{babel}
      \usepackage{geometry}
      \geometry{a4paper, left=2.5cm, right=2.5cm, top=2.5cm, bottom=2.5cm}
      % Remove dots in table of content
      \usepackage[titles]{tocloft}
      % should be loaded after the tocloft package
      \usepackage[parfill]{parskip}
      \renewcommand{\cftdot}{}

      \usepackage{amsmath}
      \usepackage{amssymb}
      \usepackage{siunitx}
      \usepackage{hyperref}
      \hypersetup{
        colorlinks=true,
        linkcolor=black,
        anchorcolor=black,
        citecolor=black,
        filecolor=black,
        menucolor=black,
        runcolor=black,
        urlcolor=black,
        pageanchor=true,
        pdftitle={<doctitle>},
        pdfauthor={<author>}
      }

      \usepackage{graphicx}
      \usepackage{float}

      % Combines tabularx with multipage support
      \usepackage{xltabular}
      \usepackage{tabularx}
      \usepackage[version=4]{mhchem}
      \usepackage{multicol}
      \usepackage{multirow}
      \usepackage{array}
      \usepackage[nomain,savewrites,acronym,toc]{glossaries}
      \usepackage{glossaries-extra}
      ]],
      {
        --
        lang = c(1, { t("english"), t("dutch"), t("portuguese") }),
        --
        doctitle = i(2, "title"),
        --
        author = i(3, "author"),
      },
      { delimiters = "<>" }
    )
  ),
  --
  s(
    { trig = "trc2", desc = "Insert a table row with 2 columns." },
    fmt(
      [[
      <col1> & <col2> \\
      ]],
      {
        -- column 1
        col1 = i(1),
        -- column 2
        col2 = i(2),
      },
      { delimiters = "<>" }
    )
  ),
  --
  s(
    { trig = "trc3", desc = "Insert a table row with 3 columns." },
    fmt(
      [[
      <col1> & <col2> & <col3> \\
      ]],
      {
        -- column 1
        col1 = i(1),
        -- column 2
        col2 = i(2),
        -- column 3
        col3 = i(3),
      },
      { delimiters = "<>" }
    )
  ),
  --
  s(
    { trig = "trc4", desc = "Insert a table row with 4 columns." },
    fmt(
      [[
      <col1> & <col2> & <col3> & <col4> \\
      ]],
      {
        -- column 1
        col1 = i(1),
        -- column 2
        col2 = i(2),
        -- column 3
        col3 = i(3),
        -- column 4
        col4 = i(4),
      },
      { delimiters = "<>" }
    )
  ),
  --
  s(
    { trig = "trc5", desc = "Insert a table row with 5 columns." },
    fmt(
      [[
      <col1> & <col2> & <col3> & <col4> & <col5> \\
      ]],
      {
        -- column 1
        col1 = i(1),
        -- column 2
        col2 = i(2),
        -- column 3
        col3 = i(3),
        -- column 4
        col4 = i(4),
        -- column 4
        col5 = i(5),
      },
      { delimiters = "<>" }
    )
  ),
})
